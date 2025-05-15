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
- ### Making it scroll
    > #### It is very rare to encounter an app that doesn't have some sort of scrolling content.
    > #### Scrolling, especially vertical scrolling, is one of the most natural paradigms in mobile development.
    > #### When you have a list of elements that can extend beyond the height of a screen you'll need to use some sort of scrollable widget. 
    > #### Scrolling content is actually rather easy to accomplish in Flutter. 
    > #### To get started with scrolling, a great widget is ListView. Just like Columns, ListViews control a list of child widgets and place them one after another.
    > #### However, ListViews will also make that content scroll automatically when their height is bigger than the height of their parent widget.
    > #### In this recipe, we're going to add laps to our stopwatch app and display those laps in a scrollable list.
- Handling large datasets with list builders
    > #### There is an interesting trick that mobile apps use when they need to render lists of data that can potentially contain more entries than your device has memory to display. 
    > #### This was especially critical in the early days of mobile app development, when phones were a lot less powerful than they are today.
    > #### Imagine that you had to create a contacts app, where your user could potentially have hundreds and hundreds of scrollable contacts. If you put them all in a single ListView and asked Flutter to create all of these widgets, there would be a point where your app could run out of memory, slow down, and even potentially crash.
    > #### Take a look at the contacts app on your phone and scroll up and down really fast. These apps don't show any delay while scrolling, and they certainly aren't in any danger of crashing because of the amount of data.
    > #### What's the secret? If you look carefully at your app, you'll see that only so many items can fit on the screen at once, regardless of how many entries there are in your list.
    > #### So, some smart engineers figured out they can recycle these views. When a widget moves off screen, why not reuse it with the new data?
    > #### This trick has existed since the beginning of mobile development and is no different today.
    > #### In this recipe, we're going to optimize the stopwatch app from the previous recipe to employ recycling when our dataset grows beyond what our phones can handle.
- Working with TextFields
    > #### Together with buttons, another extremely common form of user interaction is the text field.
    > #### There comes a point in most apps where your users will need to type something; for example, a formwhere users need to type in their username and password.
    > #### Because the text is often related to the concept of forms, Flutter also has a subclass of TextField called TextFormField, which adds functionality for multiple text fields to work together.
    > #### In this recipe, we're going to create a login form for our stopwatch app so that we know which runner we're timing.
- Navigating to the next screen
    > #### So far, all our examples have taken place on a single screen. In most real-world projects,
    > #### you might be managing several screens, each with their own paths that can be pushed and
    > #### popped onto the screen.
    > #### Flutter, and more specifically MaterialApp, uses a class called Navigator to manage your
    > #### app's screens. Screens are abstracted into a concept called Routes, which contain both the
    > #### widget we want to show and how we want to animate them on the screen. Navigator also
    > #### keeps a full history of your routes so that you can return to the previous screens easily.
    > #### In this recipe, we're going to link LoginScreen and StopWatch so that
    > #### LoginScreen actually logs you in.
- Invoking navigation routes by name
    > #### Routing is a concept that is so engrained into the internet that we almost don't think about it anymore.
    > #### In Flutter, you can use named routes. This means you can assign a textual name to your screens and simply invoke them as if you were just going to another page on a website.
    > #### In this recipe, you are going to update the existing routing mechanism in the stopwatch project so that you can use named routes instead.
- Showing dialogs on the screen
    > #### Dialogs, or popups, are used when you want to give a message to your users that needs their attention.
    > #### This ranges from telling the user about some error that occurred or asking them to perform some action before continuing, or even giving them a warning.
    > #### As alerts require some feedback from the user, you should use them for important information prompts or for actions that require immediate attention: in other words, only when necessary.
    > #### In this recipe, we're going to create a platform-aware alert and use it to show a prompt when the user stops the stopwatch.
    > #### The way Flutter handles dialogs is fascinating in terms of its simplicity. Dialogs are just routes.
    > #### The only difference between a MaterialPageRoute and a Dialog is the animation that Flutter uses to display them. Since dialogs are just routes, they use the same Navigator API for pushing and popping.
    > #### This is accomplished by calling the showDialog or showCupertinoDialog global function.
    > #### Both of these functions will look for the app's Navigator and push a route onto the navigation stack using the platform-appropriate animation.
    
    > #### An alert, whether Material or Cupertino, is made up of three components:
    > #### Title
    > #### Content
    > #### Actions
    
    > #### The title and content properties are just widgets. Typically, you would use a Text widget, but that's not required.
    > #### If you want to put an input form and a scrolling list in a Center widget, you could certainly do that.
    > #### The actions are also usually a list of buttons, where users can perform an appropriate action.
    > #### Note that closing the dialog is just a standard call to the Navigator API. Since dialogs are routes, we can treat them identically. 
    > #### On Android, the system's back button will even pop the dialog from the stack, just as you would expect.
- Presenting bottom sheets

