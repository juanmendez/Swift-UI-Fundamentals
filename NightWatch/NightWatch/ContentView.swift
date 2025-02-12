//
//  ContentView.swift
//  NightWatch
//
//  Created by Mendez, Juan on 2/11/25.
//

import SwiftUI

// We use @Composable to set a function as a component in Jetpack Compose.
// Here View is a contract to set the struct as a Swift UI View
struct ContentView: View {

    // Just like Composables, structs do not need to return a value
    // Each View child is registered in the tree of Views.

    // When you create a custom view, Swift infers this type from your
    // implementation of the required ``View/body-swift.property`` property.
    // associatedtype Body : View
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Kotlin")
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                    .padding()

                Text("Swift")
                    .font(.title)
                    .foregroundColor(.orange)
                    .padding()

                Text("Objective-C")
                    .font(.headline)
                    .foregroundColor(.green)
                    .padding()

                Text("Java")
                    .font(.subheadline)
                    .foregroundColor(.blue)
                    .padding()

                Text("Dart")
                    .font(.body)
                    .foregroundColor(.red)
                    .padding()
            }
            Spacer()
        }
        Spacer()
    }
}

// We use @Preview in Jetpack Compose, this is the syntax to preview a View
#Preview {
    ContentView()
}
