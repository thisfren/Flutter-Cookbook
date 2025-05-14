# Stopwatch

Frontend application design is often divided into two categories – user interface (UI) and user experience (UX).
The user interface is made up of all the elements on the screen – images, colors, panels, text, and so on.
The user experience is what happens when your users interact with your interfaces. It governs interactivity, navigation, and animations.
If the UI is the "what" of app design, then the UX is the "how."
So far, we have covered some of the user interface components in Flutter. Now, it's time to make our widgets useful and start building interactivity.
We're going to cover some of the primary widgets that are used to deal with user interactions – in particular buttons, TextFields, ScrollViews, and dialogs.
You will also use the Navigator to create apps with multiple screens.

Throughout this chapter, you are going to build a single app called Stopwatch. 
This will be a fully functioning stopwatch that will keep track of laps and show a full history of every completed lap.
In this chapter, we're going to cover the following recipes:
- ### Adding state to your app
    > #### So far, we've only used StatelessWidget components to create user interfaces.
    > #### These widgets are perfect for building static layouts, but they cannot change.
    > #### Flutter has another type of widget called StatefulWidget.
    > #### Stateful widgets can keep information and know how to recreate themselves whenever their State changes.
    > #### Compared to StatelessWidgets, StatefulWidgets have a few more moving parts.
    > #### The State class has a life cycle.
    > #### Unlike StatelessWidget, which is nothing more than a build method, StatefulWidgets have a few different life cycle methods that are called in a specific order.
    > #### The full list of life cycle methods, in order, is as follows:
    > - #### initState
    > - #### didChangeDependencies
    > - #### didUpdateWidget
    > - #### build (required)
    > - #### reassemble
    > - #### deactivate
    > - #### dispose
    > #### In this recipe, we're going to create a very simple stopwatch that increments its counter once a second.
- ### Interacting with buttons
    > #### Buttons are one of the most important types of interactions in apps.
    > #### It's almost impossible to imagine an app that doesn't have a button in some form or another.
    > #### They are extremely flexible: you can customize their shape, color, and touch effects; provide haptic feedback; and more.
    > #### But regardless of the styling, all buttons serve the same purpose.
    > #### A button is a widget that users can touch (or press, or click). When their finger lifts off the button, they expect the button to react.
    > 
    > #### In this recipe, you are going to add two buttons to the stopwatch app:
    > #### one to start the counter and another to stop it. 
    > #### You going are going to use two different styles of buttons – ElevatedButton and TextButton – for these different functions, but note that even though they look different, their API is the same.
    > #### Buttons in Flutter are pretty simple – they are just widgets that accept a function.
    > #### These functions are then executed when the button detects an interaction. If a null value is supplied to the onPressed property, Flutter considers the button to be disabled.
- Making it scroll
- Handling large datasets with list builders
- Working with TextFields
- Navigating to the next screen
- Invoking navigation routes by name
- Showing dialogs on the screen
- Presenting bottom sheets
