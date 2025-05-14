## A tree data structure is a favorite of computer engineers. Trees elegantly describe hierarchies with a parent-child relationship. You can find user interfaces (UIs) expressed as trees everywhere:
HyperText Markup Language (HTML) and the Document Object Model (DOM) are trees.
UIViews and their subviews are trees.
The Android Extensible Markup Language (XML) layout is a tree.

### While developers are subconsciously aware of this data structure, it's not nearly as present in the foreground as it is with Flutter. 
This is why managing your widget trees becomes more important as your app grows. You could, in theory, create one single widget that is tens of thousands of layers deep, but maintaining that code would be a nightmare!

### This chapter will cover various techniques that you can use to bring the widget tree to heel. We will explore layout techniques with columns and rows, as well as refactoring strategies that will be critical to keeping your widget tree pruned.

# In this chapter, we will be covering the following recipes:
- ## Placing widgets one after another
- ## Proportional spacing with the Flexible and Expanded widgets
- ## Drawing shapes with CustomPaint
- ### Nesting complex widget trees
    > #### Your effectiveness with any given platform is measured by how fast you can make changes.
    > #### Hot reload helps with this exponentially. Being able to quickly edit properties on a widget, hit Save, and almost instantly see your results without losing state is wonderful.
    > #### This feature enables you to experiment. It also allows you to make mistakes and quickly undo them without wasting precious compile time.
- ### Refactoring widget trees to improve legibility
    > #### There is a delightfully sardonic anti-pattern in coding known as the pyramid of doom. 
    > #### This pattern describes code that is excessively nested (such as 10+ nested if statements and control flow loops).
    > #### You end up getting code that, when you look at it from a distance, resembles a pyramid. Pyramid-like code is highly bug-prone. It is hard to read and, more importantly, hard to maintain.
    > #### Widget trees are not immune to this deadly pyramid. In this chapter, we've tried to keep our widget trees fairly shallow, but none of the examples so far is really indicative of production code—they are simplified scenarios to explain the fundamentals of Flutter.
    > #### The tree only grows deeper from here. To fight the pyramid of doom, we're going to use a weapon known as refactoring. 
    > #### This is a process of taking code that is not written ideally and updating the code without changing its functionality. We can take our n-layer deep widget trees and refactor them toward something easier to read and maintain.
    > #### In this recipe, we're going to take a large and complicated widget tree and refactor it toward something cleaner.
- ## Applying global themes