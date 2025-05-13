// lib/main.dart
import 'package:flutter/material.dart' show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:mastering_layout/flex_screen.dart';
import 'package:mastering_layout/profile_screen.dart' show ProfileScreen;



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: ProfileScreen(),
      home: FlexScreen()
    );
  }
}