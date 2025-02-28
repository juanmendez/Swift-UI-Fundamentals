This chapter starts with demos. 

### Learn about @state objects which store data and propagate updates to its listeners which are part of the UI.

We learn also about passing a state object to subviews via @binding.

I like hoisting, so here I pass in a explicit maner the state object to the subview, and a closure to notify the parent view of the toggle action.

Also it is nice that in a preview we can also declare state objects, and are interactive.

![Image](https://github.com/user-attachments/assets/25445d01-d8cf-4605-b792-2dc14a66071b)


### Here we start looking at @binding.  This property wrapper allows to have a reference of the state object in such a way it can modify it in the subview.

<img width="1420" alt="Image" src="https://github.com/user-attachments/assets/ef783cf9-45d8-43c6-a1ec-168a9f08ab8f" />

### We also lear about environments which store the state object in a global way so subviews can find them by key..

<img width="1419" alt="Image" src="https://github.com/user-attachments/assets/62bf2996-d335-433f-ac6e-5ee14ec3d572" />


### One demo is about comign with ways to preview ViewModels based on protocols..

<img width="1425" alt="Image" src="https://github.com/user-attachments/assets/532db797-885c-4de3-8f5d-574703bbb16f" />


### Brining the same behavior of the last chapter from Pluralsight


I have been working in a unidirectional flow of having ViewModels handle business logic and emitting data to the Views formatted to meet their needs, and also having Views sending events back to the ViewModel. I have implented the flow in Flutter and Android. I remember when a tech lead in my Flutter team mentioned to keep Views or Widgets as they are called as dumb as possible. It took me a while to get used to this way of working. It is a useful way to always have Views portable anywhere in an application, also lose coupled with ViewModels. Views are expected to receive data, and have a few methods available as closures to send events back to the ViewModel. This is called [Hoisting](https://developer.android.com/develop/ui/compose/state-hoisting) in Jetpack Compose.

![Image](https://developer.android.com/static/develop/ui/compose/images/state-unidirectional-flow.png)

I am having a bit of a hard time understanding in this chapter having a ViewModel found across several Views. My idea is to have a contract between the View and ViewModel. So Views only know the contract and the contact can be easily applied in Previews. By contract I mean to use a protocol which can be implemented by a ViewModel or a struct for preview purposes, see `FirstViewModel`.


### Another story coming from this tutorial.

I have gone over xcode fundamentals, and learned a lot how to write code and make use of its utilities. I am finding at times xcode is slow or never highlights any syntax error unless the app gets built. In this chapter I started to play with Fleet. I find it very useful. It is quick to auto complete code, and highlights my Kotlin mistakes as I type `val` instead of `let`.

![Image](https://github.com/user-attachments/assets/392e67e4-329a-42f1-aa13-65481d1acb46)


Here is a preview, no pun intended, of this Swift UI app.

![Image](https://github.com/user-attachments/assets/87a9ba97-e9b5-49a4-a544-f5e6477bc189)

