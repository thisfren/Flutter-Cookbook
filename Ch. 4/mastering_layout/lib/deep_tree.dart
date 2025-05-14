// lib/deep_tree.dart

import 'package:flutter/material.dart' show BuildContext, Colors, Column, Container, Expanded, FlutterLogo, MainAxisAlignment, Row, SafeArea, Scaffold, StatelessWidget, Text, Widget;


class DeepTree extends StatelessWidget {
  const DeepTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlutterLogo(),
                Text('Flutter is amazing.'),
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.purple
              ) 
            ),
            Text("It's all widgets!"),
            Text("Let's find out how deep the rabbit hole goes.")
          ],
        ),
      )
    );
  }
}