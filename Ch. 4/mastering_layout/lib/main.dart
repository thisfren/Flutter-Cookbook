// lib/main.dart
import 'package:flutter/material.dart' show BuildContext, MaterialApp, StatelessWidget, Widget;
import 'package:mastering_layout/profile_screen.dart' show ProfileScreen;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}