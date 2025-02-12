# Swift UI Fundamentals - Chapter 2

In the content library we can find what Views are available.

<img width="681" alt="Image" src="https://github.com/user-attachments/assets/b6a36534-3af3-4b7f-81d3-5471b01c9870" />

We are able to find all attributes, and we can filter to find for example the ones available for Text

<img width="841" alt="Image" src="https://github.com/user-attachments/assets/74b36e22-116c-466d-bd5e-a983ec7de800" />


Right click on a View, then select Show UI Inspector.. The shortcut is control + option + click.

<img width="465" alt="Image" src="https://github.com/user-attachments/assets/5960c057-3170-4394-afc3-18056d86ac6e" />

We can also get to preview to larger fonts when designing Swift UI

![Image](https://github.com/user-attachments/assets/9bda9d78-2363-4573-94dd-8d30184102cb)

In this chapter we learned about making our own modifiers. Doesn't that word sound familiar? Because it is heavily used in Composables!

```swift
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
```