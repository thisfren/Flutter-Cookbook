// lib/main.dart
/*
 * We need to create a new shell for the app that will host the MaterialApp widget.
 * This root app will still be stateless, but things will be more mutable in its children.
 */

import 'package:flutter/material.dart' show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:stopwatch/login_screen.dart' show LoginScreen;
// import 'package:stopwatch/stopwatch.dart' show StopWatch;


void main() => runApp(StopwatchApp());


class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: StopWatch()
      home: LoginScreen()
    );
  }
}