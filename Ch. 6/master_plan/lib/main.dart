// lib/main.dart

import 'package:flutter/material.dart' show BuildContext, ColorScheme, Colors, MaterialApp, StatelessWidget, ThemeData, Widget, runApp;

import './views/plan_screen.dart';


void main() => runApp(MasterPlanApp());


class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple), useMaterial3: true),
      home: PlanScreen()
    );
  }
}