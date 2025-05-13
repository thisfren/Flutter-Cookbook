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
- ## Nesting complex widget trees
- ## Refactoring widget trees to improve legibility
- ## Applying global themes