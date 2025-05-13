// src/lib/basic_screen.dart
/*
 * In this recipe, we will be creating a basic screen with a Scaffold widget.
 * The Scaffold widget is the most common way to create a screen in Flutter.
 * It provides a default AppBar, Drawer, BottomNavigationBar, FloatingActionButton, and more.
 * Scaffolds are also aware of your device's metrics.
 * You can also use the Scaffold widget to create a screen that is not a full-screen app.
 * Widgets that do not begin with Scaffold are intended to be components used to compose screens.
 */
import 'package:flutter/material.dart' show AppBar, AspectRatio, BuildContext, Center, Colors, Column, Container, CrossAxisAlignment, Drawer, EdgeInsets, Icon, Icons, Padding, Scaffold, StatelessWidget, Text, Widget;

import 'package:flutter_layout/immutable_widget.dart' show ImmutableWidget;
import 'package:flutter_layout/text_layout.dart' show TextLayout;

class BasicScreen extends StatelessWidget {
  const BasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( // AppBar will render differently depending on whether you are on iOS or Android
        backgroundColor: Colors.indigo,
        title: Text('Welcome to Flutter'),
        actions: <Widget> [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(Icons.edit),
          )
        ]
      ),
      // body: Center( // A Center widget centers its child both horizontally and vertically
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        /*
        You can use the AspectRatio widget when you want to size a widget following a specific aspect ratio.
        The AspectRatio widget tries the largest width possible in its context, and then sets the height applying the chosen aspect ratio to the width.
        */
        children: [
          AspectRatio(
            aspectRatio: 1.0,
            child: ImmutableWidget(),
          ),
          TextLayout()
        ]
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.lightBlue,
          child: Center(
            child: Text("I'm a Drawer!")
          )
        )
      )
    );
  }
}