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
    @ObservedObject
    private var viewModel = SectionsViewModel()

    @State
    private var resetAlertShowing = false

    // Just like Composables, structs do not need to return a value
    // Each View child is registered in the tree of Views.

    // When you create a custom view, Swift infers this type from your
    // implementation of the required ``View/body-swift.property`` property.
    // associatedtype Body : View
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.sectionModels, id: \.self) { sectionModel in
                    SectionView(
                        sectionModel: sectionModel,
                        onMoveHandler: { indexSet, newOffset in
                            viewModel.onMoveHandler(sectionModel: sectionModel, indices: indexSet, newOffset: newOffset)
                        },
                        onDeleteHandler: viewModel.onDeleteTask,
                        onCompletionChange: viewModel.onCompletionChange
                    )
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle(Text("Home"))
            .toolbar {
                ToolbarItem(placement: .bottomBar) {
                    Toggle("Focus On", isOn: $viewModel.focusOn)
                    .toggleStyle(.switch)
                    .frame(width: 175)
                }
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        resetAlertShowing = true
                    }, label: {
                        Text("Reset")
                    })
                }
            }
        }
        .alert("Reset List", isPresented: $resetAlertShowing) {
            Button(role: .cancel) {

            } label: {
                Text("Cancel")
            }

            Button(role: .destructive) {
                viewModel.reset()
            } label: {
                Text("Yes, reset it")
            }

        } message: {
            Text("Are you sure?")
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
// Due to time constraints, I could not set up a contract, but in other cases a ViewModel can become more complex
// and that's when a contract is handy for previews.
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

