import SwiftUI

struct ContentView: View {

    // Part B - State variables.
    // @State holds values that belong to this view and may change while
    // the application is running. Whenever one of them changes, SwiftUI
    // recomputes body and updates the screen.

    @State private var students: [Student] = []
    @State private var studentName = ""
    @State private var markText = ""
    @State private var message = ""

    // Part G - The passed student count.
    // This is a computed property, so it is recalculated every time the
    // students array changes.

    private var passedCount: Int {
        students.filter { $0.passed }.count
    }

    var body: some View {

        NavigationStack {

            VStack(spacing: 16) {

                // Part C - The input interface.

                VStack(spacing: 12) {

                    TextField("Student Name", text: $studentName)
                        .textFieldStyle(.roundedBorder)

                    // $markText is a binding, which lets the text field
                    // read and change the stored value.
                    TextField("Mark", text: $markText)
                        .textFieldStyle(.roundedBorder)
                        .keyboardType(.numberPad)

                    Button("Add Student") {
                        addStudent()
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding(.horizontal)

                // The message explains why an entry was rejected, so the
                // interface does not rely on colour alone.

                if !message.isEmpty {
                    Text(message)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                }

                HStack {

                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(.green)

                    Text("Passed Students: \(passedCount)")
                        .font(.headline)
                }

                // Part E - The student list.

                if students.isEmpty {

                    Spacer()

                    VStack(spacing: 8) {

                        Image(systemName: "person.3.fill")
                            .font(.system(size: 40))
                            .foregroundStyle(.secondary)

                        Text("No students added yet")
                            .foregroundStyle(.secondary)
                    }

                    Spacer()

                } else {

                    List(students) { student in

                        // Part F - Each row opens the detail screen.

                        NavigationLink {

                            StudentDetailView(student: student)

                        } label: {

                            HStack {

                                Text(student.name)

                                Spacer()

                                Text("\(student.mark)")
                                    .bold()
                                    .foregroundStyle(student.passed ? .green : .red)

                                Text(student.passed ? "Pass" : "Fail")
                                    .font(.caption)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .padding(.top)
            .navigationTitle("SE4041 Marks")
        }
    }

    // Part D - Adding a student.
    // guard is used to reject an empty name, a mark that is not a whole
    // number, and a mark outside 0 to 100. Nothing is added and the
    // application does not crash in any of those cases.

    private func addStudent() {

        let trimmedName = studentName.trimmingCharacters(in: .whitespaces)

        guard !trimmedName.isEmpty else {
            message = "Enter a student name."
            return
        }

        guard let mark = Int(markText) else {
            message = "The mark must be a whole number."
            return
        }

        guard mark >= 0 && mark <= 100 else {
            message = "The mark must be between 0 and 100."
            return
        }

        let student = Student(name: trimmedName, mark: mark)
        students.append(student)

        // Clear the input fields after a successful addition.
        studentName = ""
        markText = ""
        message = ""
    }
}

#Preview {
    ContentView()
}
