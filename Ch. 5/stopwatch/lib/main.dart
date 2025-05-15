// lib/main.dart
/*
 * We need to create a new shell for the app that will host the MaterialApp widget.
 * This root app will still be stateless, but things will be more mutable in its children.
 */

import 'package:flutter/material.dart' show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:stopwatch/login_screen.dart' show LoginScreen;
import 'package:stopwatch/stopwatch.dart' show StopWatch;


void main() => runApp(StopwatchApp());


class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      If you look at the way we define the routes in MaterialApp, the home route is required.
      You can achieve this with the "/" symbol. Then, you can set up the other routes for your app.
      */
      routes: {
        '/': (context) => LoginScreen(),
        /*
        It is recommended that you define constants for your routes and use those instead of string literals.
        In this recipe, we put the constants as static elements for each screen.
        There is no real requirement to organize your code like that; you could also keep your constants in a single file if you prefer.
        */
        LoginScreen.route: (context) => LoginScreen(),
        StopWatch.route: (context) => StopWatch(),
      },
      initialRoute: '/', // Once the routes have been declared, MaterialApp needs to know which route to start with
      // home: StopWatch()
      // home: LoginScreen()
    );
  }
}