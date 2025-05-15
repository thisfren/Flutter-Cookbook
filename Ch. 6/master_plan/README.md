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
- ### Managing the data layer with InheritedWidget
- ### Making the app state visible across multiple screens
- ### Designing an n-tier architecture, part 1 – controllers
- ### Designing an n-tier architecture, part 2 – repositories
- ### Designing an n-tier architecture, part 3 – services
