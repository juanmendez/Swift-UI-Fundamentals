//
//  ContentView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/11/25.
//

import SwiftUI

// We use @Composable to set a function as a component in Jetpack Compose.
// Here View is a contract to set the struct as a Swift UI View
struct ListWithSectionsView: View {

    // Just like Composables, structs do not need to return a value
    // Each View child is registered in the tree of Views.

    // When you create a custom view, Swift infers this type from your
    // implementation of the required ``View/body-swift.property`` property.
    // associatedtype Body : View
    var body: some View {
        List {
            Section(
                content: {
                    ForEach(nightlyTasks, id: \.self) {
                        Text($0)
                    }
                },
                header: {
                    HStack {
                        Image(systemName: "moon.stars")
                        Text("Nightly Tasks")
                    }.headerStyle(color: .black)
                }
            )

            Section(
                content: {
                    ForEach(weeklyTasks, id: \.self) {
                        Text($0)
                    }
                },
                header: {
                    HStack {
                        Image(systemName: "sunset")
                        Text("Weekly Tasks")
                    }.headerStyle(color: .orange)
                }
            )

            Section(
                content: {
                    ForEach(monthlyTasks, id: \.self) {
                        Text($0)
                    }
                },
                header: {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Monthly Tasks")
                    }.headerStyle(color: .red)
                }
            )
        }.listStyle(GroupedListStyle())
    }
}

// Here is a customed modifier
struct HeaderStyle: ViewModifier {
    var color: Color = .yellow
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .fontWeight(.heavy)
            .foregroundStyle(color)
            .textCase(.uppercase)
            .underline()
    }
}

extension View {
    // to make it easier to access HeaderStyle, we can include an extension!
    func headerStyle(color: Color = .yellow) -> some View {
        self.modifier(HeaderStyle(color: color))
    }
}

// We use @Preview in Jetpack Compose, this is the syntax to preview a View
#Preview("ContentView Portrait") {
    ListWithSectionsView()
}

#Preview(
    "ContentView Landscape", traits: .landscapeRight,
    body: {
        ListWithSectionsView()
    })

struct ContentViewLargeFont: PreviewProvider {
    static var previews: some View {
        ListWithSectionsView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)  // Simulate accessibility setting
    }
}
