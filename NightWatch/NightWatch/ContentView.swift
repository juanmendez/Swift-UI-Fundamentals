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
                HStack {
                    Text("\(Image(systemName: "iphone.case")) Fun Languages")
                        .headerStyle(color: .red)
                }
                
                Spacer()
                    .frame(height: 20.0)
                
                Text("Kotlin")
                    .font(.largeTitle)
                    .foregroundColor(.purple)
                    .padding()
                    .bold()

                Text("Swift")
                    .font(.title)
                    .strikethrough()
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
            .padding(.leading, 17.0)
            .fontWeight( /*@START_MENU_TOKEN@*/.bold /*@END_MENU_TOKEN@*/)
            .underline()

            /**
             I noticed Text has by default font weight inheritance.. So on purpose I assigned the font weight to the parent View.
             So this actually works.
             
             Same case with assigning underline to parent View.
             */

            Spacer()
        }
        Spacer()
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
    ContentView()
}

#Preview("ContentView Landscape", traits: .landscapeRight, body: {
    ContentView()
})


struct ContentViewLargeFont: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge) // Simulate accessibility setting
    }
}
