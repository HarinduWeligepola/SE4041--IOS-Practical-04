import SwiftUI

// The detail screen receives one student and displays it. It does not
// own the data, so the value is stored in a plain let instead of @State.

struct StudentDetailView: View {

    let student: Student

    var body: some View {

        VStack(spacing: 20) {

            Image(systemName: "person.circle.fill")
                .font(.system(size: 80))
                .foregroundStyle(.blue)

            Text(student.name)
                .font(.largeTitle)
                .bold()

            Text("Mark: \(student.mark)")
                .font(.title2)

            Text("Grade: \(student.grade)")
                .font(.title2)

            // The result is shown as text as well as colour, so the
            // screen is still readable without relying on colour alone.

            Text(student.passed ? "Pass" : "Fail")
                .font(.title)
                .bold()
                .foregroundStyle(student.passed ? .green : .red)

            Spacer()
        }
        .padding()
        .navigationTitle("Student Details")
    }
}

#Preview {
    NavigationStack {
        StudentDetailView(student: Student(name: "Amal", mark: 72))
    }
}
