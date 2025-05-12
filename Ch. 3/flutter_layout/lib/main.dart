import 'package:flutter/material.dart' show runApp, BuildContext, MaterialApp, StatelessWidget, Widget;

import 'immutable_widget.dart' show ImmutableWidget;
import 'package:flutter_layout/basic_screen.dart' show BasicScreen;

/*
This line initializes the Flutter framework and places a StaticApp, which is just another stateless widget, at the root of the tree.
*/
void main() => runApp(StaticApp());

/*
Our root class, StaticApp, is just a widget.
Every item in Flutter inherits from the widget class.
This class will be used to set up any global data that needs to be accessed by the rest of our app.

The core of every StatelessWidget is the build() method.
Flutter will call this method every time it needs to repaint a given set of widgets.
Since we are only using stateless widgets in this recipe, that should never happen, unless you rotate your device/emulator or close the app.
*/
class StaticApp extends StatelessWidget {
  @override
  /*
  This first build method returns a MaterialApp, which contains our ImmutableWidget.
  Material apps are one of the primary building blocks for apps that follow Google's Material Design specification.
  This widget creates several helper properties, such as navigation, theming, and localization.
  You can also use a CupertinoApp if you want to follow Apple's design language, or a WidgetsApp if you want to create your own.
  */
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ImmutableWidget(),
      home: BasicScreen(),
    );
  }
}

