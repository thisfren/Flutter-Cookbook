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
    > #### How should you call the data classes in your app?
    > #### You could, in theory, set up a place in static memory where all your data classes will reside, but that won't play well with tools such as Hot Reload and could even introduce some undefined behavior down the road.
    > #### The better options involve placing your data classes in the widget tree so they can take advantage of your application's life cycle.
    > #### The question then becomes, how can you place a model in the widget tree?
    > #### Models are not widgets, after all, and there is nothing to build onto the screen.

    > #### A possible solution is using InheritedWidget. 
    > #### So far, we've only been using two types of widgets: StatelessWidget and StatefulWidget.
    > #### Both of these widgets are concerned with rendering widgets onto the screen; the only difference is that one can change and the other cannot.
    > #### InheritedWidget is another beast entirely. Its job is to pass data down to its children, but from a user's perspective, it's invisible. 
    > #### InheritedWidget can be used as the doorway between your view and data layers.
    > #### In this recipe, we will be updating the Master Plan app to move the storage of the to-do lists outside of the view classes.
- ### Making the app state visible across multiple screens
    > #### One phrase that is thrown around a lot in the Flutter community is "Lift State Up." 
    > #### This mantra, which originally came from React, refers to the idea that State objects should be placed higher than the widgets that need it in the widget tree.
    > #### Our InheritedWidget, which we created in the previous recipe, works perfectly for a single screen, but it is not ideal when you add a second. The higher in the tree your state object is stored, the easier it is for your children widgets to access it.
    > #### In this recipe, you are going to add another screen to the Master Plan app so that you can create multiple plans. Accomplishing this will require our State provider to be lifted higher in the tree, closer to its root.
- ### Designing an n-tier architecture, part 1 – controllers
    > #### There are many architectural patterns that have become popular in the last couple of years
    > #### – Model View Controller (MVC), Model View ViewModel (MVVM), Model View Presenter (MVP), Coordinator, and several others.
    > #### These patterns have become so numerous that they are sometimes pejoratively referred to as MV* patterns.
    > #### This essentially means that no matter which pattern you choose, you need some kind of intermediary object between your model and your view.
    > #### 
    > #### A concept that is shared by all the popular patterns is the idea of tiers/layers (we will be using the terms tier and layer interchangeably throughout this chapter).
    > #### Each tier in your app is a section of the MV* classes that have a single responsibility. 
    > #### The term n-tier (sometimes called a multi-tier architecture) just means that you are not limited on the number of tiers in your app. You can have as many or as few as you need.
    > #### The top-most tier is one that you are already familiar with – the view/widget tier. This tier is only interested in setting up the user interface. All the data and logic for the app should be delegated to a lower tier.
    > #### The first tier that typically sits underneath the view tier is the controller layer. These classes are responsible for handling business logic and providing a link between the views and the lower layers in our app.
    > #### In this recipe, we'll be moving the business logic for the Master Plan app from the view to a new controller class. We will also be adding the ability to delete notes from the list.

- ### Designing an n-tier architecture, part 2 – repositories
- ### Designing an n-tier architecture, part 3 – services
