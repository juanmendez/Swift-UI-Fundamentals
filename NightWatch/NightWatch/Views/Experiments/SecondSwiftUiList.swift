import SwiftUI

let myList = [
    "Check all windows",
    "Check all doors",
    "Check that the safe is locked",
    "Check the mailbox",
    "Inspect security cameras",
    "Clear ice from sidewalks",
    "Document \"strange and unusual\" occurrences",
]

struct SecondSwiftUiList: View {
    var body: some View {
        List(myList, id: \.self) { element in
            Text(element)
        }
    }
}

#Preview("SecondSwiftUiList") {
    SecondSwiftUiList()
}

#Preview(
    "SecondSwiftUiList Landscape",
    traits: .landscapeRight,
    body: {
        SecondSwiftUiList()
    }
)
