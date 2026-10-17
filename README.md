# SE4041 - Practical 04: Building Your First iOS App with SwiftUI

**Module:** SE4041 - Mobile Application Design and Development
**Programme:** BSc (Hons) in Information Technology - Interactive Media
**Year 04, Semester 01**
**Platform:** iOS
**Framework:** SwiftUI

## Student Details

| | |
|---|---|
| Name | Harindu Weligepola |
| Student ID | 23257504 |

## Practical Overview

This practical brings the Swift language work from Practicals 01 to 03
into a working iOS application. It covers creating and running an Xcode
project, building interfaces with `Text`, `Image`, stacks, `Spacer` and
modifiers, managing changing values with `@State`, accepting input with
`TextField` and bindings, displaying collections with `List`, making a
model `Identifiable`, and moving between screens with `NavigationStack`
and `NavigationLink`.

## Opening the Project

Open `MarksApp.xcodeproj` in Xcode, choose an iPhone Simulator from the
toolbar and press **Command + R**.

The project targets iOS 17.0 and Swift 5. If your Xcode is older than 15,
set the deployment target to a version it supports under
**Project > MarksApp > General**.

## Original Project Settings

The project was created with **iOS > App** using:

```
Product Name: MarksApp
Interface:    SwiftUI
Language:     Swift
Storage:      None
```

Organization Identifier `lk.ac.sliit`, giving the bundle identifier
`lk.ac.sliit.MarksApp`.

## Source Files

| File | Purpose |
|---|---|
| `MarksAppApp.swift` | The `@main` app entry point and `WindowGroup` |
| `Student.swift` | The `Student` model, `Identifiable`, with computed `passed` and `grade` |
| `ContentView.swift` | Input fields, the Add Student button, passed count and the student list |
| `StudentDetailView.swift` | The detail screen for one student |

The model lives in `Student.swift` and is declared only once, so
`ContentView.swift` does not redeclare it. `Student.swift` imports
`Foundation` because it uses `UUID`.

## Final Task: Student Marks App

The application is titled **SE4041 Marks** and allows the user to:

1. enter a student name,
2. enter a student mark,
3. add the student to a list,
4. view all added students,
5. see at a glance whether each student passed or failed,
6. open a detail screen for each student,
7. see the total number of students who have passed.

Validation is handled with `guard` inside the Add Student action. An
empty name, a mark that is not a whole number, and a mark outside
`0...100` are all rejected, with a short message explaining why. The
input fields are cleared only after a successful addition.

The pass rule (`mark >= 50`) and the grade bands live on the model as
computed properties, so they are not repeated in the interface. The
passed count is also a computed property, which means it updates
automatically whenever a student is added.

Pass and fail are shown with text as well as colour, so the screen does
not rely on colour alone to communicate the result.

### Additional Challenge

The additional challenge is included. `Student` has a computed `grade`
property using the bands `80...100` for A down to below 40 for F, and
the grade is displayed on the detail screen.

## Testing

| Test | Input | Expected result |
|---|---|---|
| 1 | Amal, 72 | Added and shown as passing |
| 2 | Nimali, 45 | Added and shown as failing |
| 3 | *(empty name)*, 60 | Not added |
| 4 | Ruwan, `abc` | Not added |
| 5 | Ruwan, 120 | Not added |
| 6 | Tap each student | The correct detail screen opens, back button returns to the list |
| 7 | Mix of passing and failing students | Count includes only marks of 50 or above and updates on each addition |
| 8 | Marks 0, 49, 50, 100 | All four accepted; 0 and 49 fail, 50 and 100 pass; a negative mark is not added |

## Repository Structure

```
SE4041-Practical-04/
├── README.md
├── .gitignore
├── MarksApp.xcodeproj/
│   ├── project.pbxproj
│   └── xcshareddata/xcschemes/MarksApp.xcscheme
├── MarksApp/
│   ├── MarksAppApp.swift
│   ├── ContentView.swift
│   ├── Student.swift
│   ├── StudentDetailView.swift
│   └── Assets.xcassets/
└── screenshots/
    ├── 01-Student-List.png
    └── 02-Student-Details.png
```

## My Practical Evidence

![Student list](screenshots/01-Student-List.png)
![Student details](screenshots/02-Student-Details.png)

## Submission Checklist

- [ ] All practical exercises completed
- [ ] The Xcode project builds and runs in the iOS Simulator
- [ ] SwiftUI views, stacks and modifiers used appropriately
- [ ] `@State` manages changing values
- [ ] Text fields use bindings to state
- [ ] The `Student` model conforms to `Identifiable`
- [ ] The model includes the computed `passed` property
- [ ] Valid students can be added to the list
- [ ] Invalid input does not add a student or crash the app
- [ ] Input fields clear after a successful addition
- [ ] Passing and failing results are clearly identifiable
- [ ] Each student opens the correct detail screen
- [ ] The passed student count updates correctly
- [ ] All testing cases checked
- [ ] Required screenshots added
- [ ] All files committed and pushed to GitHub
