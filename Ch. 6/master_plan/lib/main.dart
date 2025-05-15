// lib/main.dart
/*
 * The main takeaway from this recipe is the importance of proper widget tree construction.
 * When you push a new route onto Navigator, you are essentially replacing every widget that lives underneath MaterialApp.
 * If PlanProvider was a child of MaterialApp, it would be destroyed when pushing the new route, making all its data inaccessible to the next widget.
 * If you have an InheritedWidget that only needs to provide data for a single screen, then placing it lower in the widget tree is optimal.
 * However, if this same data needs to be accessed across multiple screens, it has to be placed above our Navigator.
 */

import 'package:flutter/material.dart' show BuildContext, ColorScheme, Colors, MaterialApp, StatelessWidget, ThemeData, Widget, runApp;

import 'plan_provider.dart';
// import '/views/plan_screen.dart';
import 'views/plan_creator_screen.dart';


void main() => runApp(MasterPlanApp());


class MasterPlanApp extends StatelessWidget {
  const MasterPlanApp({super.key});

  @override
  Widget build(BuildContext context) {
    /*
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple), useMaterial3: true),
      // home: PlanScreen()
      home: PlanProvider(child: PlanScreen())
    );
    */
    return PlanProvider(
      child: MaterialApp(
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple), useMaterial3: true),
        home: PlanCreatorScreen()
      )
    );
  }
}