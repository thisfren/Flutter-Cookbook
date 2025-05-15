// lib/plan_provider.dart
/*
 * Create a new file called plan_provider.dart for storing our plans. 
 * Place this file in the root of the project's lib directory. 
 * This widget extends InheritedWidget. 
 */

import 'package:flutter/material.dart' show BuildContext, InheritedWidget, Widget;

import './models/data_layer.dart';


/*
InheritedWidgets are some of the most fascinating widgets in the whole Flutter framework.
Their job isn't to render anything on the screen, but to pass data down to lower widgets in the tree. 
Just like any other widget in Flutter, InheritedWidgets can also have child widgets.
*/
class PlanProvider extends InheritedWidget {
  final plan = Plan(); // First, we define an object that will store the plans

  /*
  Then, we define a default unnamed constructor, which takes in a key and a child, and passes them to the superclass (super).
  */
  PlanProvider({
    super.key,
    required Widget child
  }) : super(child: child);

  /*
  InheritedWidget is an abstract class, so you must implement the updateShouldNotify method.
  Flutter calls this method whenever the widget is rebuilt.
  In the updateShouldNotify method, you can look at the content of the old widget and determine if the child widgets need to be notified that the data has changed.
  In our case, we just return false and opt-out of this functionality.
  In most cases, it is rather unlikely that you need this method to return true.
  */
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => false;

  /*
  To make the data accessible from anywhere in the app, we need to create our first of-context method.
  */
  static Plan? of(BuildContext context) {
    /*
    Here, you are using the context's dependOnInheritedWidgetOfExactType method to kick off the tree traversal process.
    Flutter will start from the widget that owns this context and travel upward until it finds a PlanProvider.
    An interesting side effect of this method is that after it is called, the originating widget is registered as a dependency.
    This now creates a hard link between the child widget and PlanProvider.
    The next time this method is called, there is no need to travel up the tree anymore; the child already knows where the data is and can retrieve it immediately.
    This optimization makes it extremely fast, if not almost instant, to get the data from InheritedWidgets, no matter how deep the tree goes.
    */
    final provider = 
      context.dependOnInheritedWidgetOfExactType<PlanProvider>();
    return provider?.plan;
  }
}