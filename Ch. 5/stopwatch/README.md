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
    > #### In this recipe, we're going to create a very simple stopwatch that increments its counter once a second.
- Interacting with buttons
- Making it scroll
- Handling large datasets with list builders
- Working with TextFields
- Navigating to the next screen
- Invoking navigation routes by name
- Showing dialogs on the screen
- Presenting bottom sheets
