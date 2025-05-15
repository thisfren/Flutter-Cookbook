## Project: master_plan

# Basic State Management

As apps grow, managing the flow of data through the app becomes a more complex and important issue. 
The Flutter community has struggled with this problem. Due to this, they have devised several solutions to deal with state management. 
### All these solutions have one aspect they share: the separation of model and view.
Before diving into any state management solutions (BLoC, MVVM, Redux, and so on), we will explore the elements that they all share. Each of these patterns divides apps into layers. These are groups of classes that perform specific kinds of tasks. 
### Layer strategies can be applied to almost any app architecture. Once you've mastered the basics, learning any of the more advanced patterns will be easy.
### In this chapter, you are going to build a to-do note-taking application. In this application, users will be able to create to-do lists that contain many tasks. 
Users will be able to add, edit, delete, and complete their tasks.

## We will cover the following recipes:
- ### Model-view separation
    > #### Models and views are very important concepts in app architecture.
    > #### Models are classes that deal with the data for an app, while views are classes that present that data on screen.
    > #### In Flutter, the closest analogy we have to views are widgets. Subsequently, a model would be a basic dart class that doesn't inherit from anything in the Flutter framework.
    > #### Each one of these classes is responsible for one and only one job.
    > #### Models are concerned with maintaining the data for your app.
    > #### Views are concerned with drawing your interface.
    > #### When you keep a clear and strict separation between your models and views, your code will become simpler and easier to work with.
    > #### The real reason why you would want to separate the model and view classes has little to do with functionality and more to do with productivity. By separating these concepts into different components, you can compartmentalize your development process. 
    > #### When you are working on a model file, you don't need to think at all about the user interface.
    > #### At the data level, concepts such as buttons, colors, padding, and scrolling are a distraction. The goal of the data layer should be to focus on the data and any business rules you need to implement.
    > #### On the other hand, your views do not need to think about the implementation details of the data models. In this way, you achieve what's called "separation of concerns," which is a solid development pattern.
    > #### In this recipe, we're going to build the start of our Todo app and create a model graph to go along with our views.
    > #### The best place to start is the data layer. This will give you a clear view of your app, without going into the details of your user interface.
- ### Managing the data layer with InheritedWidget
- ### Making the app state visible across multiple screens
- ### Designing an n-tier architecture, part 1 – controllers
- ### Designing an n-tier architecture, part 2 – repositories
- ### Designing an n-tier architecture, part 3 – services
