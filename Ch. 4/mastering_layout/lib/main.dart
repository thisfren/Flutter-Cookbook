// lib/main.dart
/*
 * Another interesting property when dealing with themes is the brightness property.
 * The brightness enum is how Flutter supports this feature. By toggling lightness, you have seen the background and text colors automatically get dark/light.
 * There is also a darkTheme property in MaterialApp where you can design the dark version of your app.
 * These properties are platform-aware and will automatically toggle the themes based on the phone's settings.
 * Including this feature now in your app will future-proof your apps, as we are entering a world where both light and dark support is expected.
 */
import 'package:flutter/material.dart' show AppBarTheme, Brightness, BuildContext, Colors, MaterialApp, StatelessWidget, TextStyle, ThemeData, Widget, runApp;
import 'package:mastering_layout/e_commerce_screen_before.dart' show ECommerceScreenBefore;
// import 'package:mastering_layout/deep_tree.dart' show DeepTree;
// import 'package:mastering_layout/flex_screen.dart';
// import 'package:mastering_layout/profile_screen.dart' show ProfileScreen;


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.green,
        appBarTheme: AppBarTheme(
          elevation: 10,
          backgroundColor: Colors.green,  // Explicitly set AppBar background
          titleTextStyle: TextStyle(        // textTheme is deprecated
            fontFamily: 'LeckerliOne',
            fontSize: 24
          )
        ),
      ),
      // home: ProfileScreen()
      // home: FlexScreen()
      // home: DeepTree()
      home: ECommerceScreenBefore()
    );
  }
}