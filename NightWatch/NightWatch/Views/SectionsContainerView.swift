//
//  ContentView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/11/25.
//
import SwiftUI

// We use @Composable to set a function as a component in Jetpack Compose.
// Here View is a contract to set the struct as a Swift UI View
struct SectionsContainerView: View {

    // Just like Composables, structs do not need to return a value
    // Each View child is registered in the tree of Views.

    // When you create a custom view, Swift infers this type from your
    // implementation of the required ``View/body-swift.property`` property.
    // associatedtype Body : View
    var body: some View {
        NavigationStack {
            List {
                ForEach(sectionModels, id: \.sectionHeaderModel.headerText) { sectionModel in
                    SectionView(sectionModel: sectionModel)

                }
            }.listStyle(GroupedListStyle())
        }
    }
}

extension View {
    // to make it easier to access HeaderStyle, we can include an extension!
    func headerStyle(color: Color = .yellow) -> some View {
        self.modifier(HeaderStyle(color: color))
    }
}

// We use @Preview in Jetpack Compose, this is the syntax to preview a View
#Preview("SectionsContainerView Portrait") {
    SectionsContainerView()
}

#Preview(
    "SectionsContainerView Landscape", traits: .landscapeRight,
    body: {
        SectionsContainerView()
    })

struct SectionsContainerViewLargeFont: PreviewProvider {
    static var previews: some View {
        SectionsContainerView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)  // Simulate accessibility setting
    }
}
