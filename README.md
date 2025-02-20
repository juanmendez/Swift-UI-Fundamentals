# Swift UI Fundamentals - Chapter 4

What it is known as toolbar, or action bar it is known as navigation bar in SwiftUI

<img width="791" alt="Image" src="https://github.com/user-attachments/assets/7fa77231-c5a2-4a05-843e-e2fcb687f09a" />

In Jetpack Compose we have bottom nav bars whereas in Swit UI it is known as Tab Bars.

<img width="712" alt="Image" src="https://github.com/user-attachments/assets/9af6a6b7-eae2-4d49-a501-00ac0d8f3b95" />

In Jetpack compose we have [navigation components](https://developer.android.com/develop/ui/compose/navigation) , whereas in SwitUI they have [Navigation Stacks.](https://developer.apple.com/documentation/swiftui/navigationstack/).

<img width="693" alt="Image" src="https://github.com/user-attachments/assets/a612f0df-8881-46b4-879f-e59af09776dc" />

We can make new subviews by extracting views included within another view..

<img width="496" alt="Image" src="https://github.com/user-attachments/assets/8b77e6c1-a7d4-494e-92c8-0735e97de8b2" />

What is nice about this approach is having Views to be reusable and since all of the structure of Views is based on structs it doesn't load up CPU, and there is no inheritance baggage added by each subview. So we are safe to make as many subviews as we want!!!
```