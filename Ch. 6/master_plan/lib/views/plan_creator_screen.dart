// lib/views/plan_creator_screen.dart

import 'package:flutter/material.dart' show AppBar, BuildContext, Colors, Column, EdgeInsets, Expanded, FocusNode, FocusScope, Icon, Icons, InputDecoration, ListTile, ListView, MainAxisAlignment, Material, MaterialPageRoute, Navigator, Padding, Scaffold, State, StatefulWidget, Text, TextEditingController, TextField, Theme, Widget;

import '../models/plan.dart';
import '../plan_provider.dart';
import 'plan_screen.dart';


class PlanCreatorScreen extends StatefulWidget {
  const PlanCreatorScreen({super.key});

  @override
  State<PlanCreatorScreen> createState() => _PlanCreatorScreenState();
}


class _PlanCreatorScreenState extends State<PlanCreatorScreen> {
  final textController = TextEditingController();

  /*
  This screen will have a TextField at the top and a list of plans underneath it.
  */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Master Plans')),
      body: Column(children: <Widget>[
        _buildListCreator(),
        Expanded(child: _buildMasterPlans())
      ])
    );
  }

  /*
  The _buildListCreator method constructs a TextField and calls a function to add a plan when the user taps Enter on their keyboard.
  We're going to wrap TextField in a Material widget to make the field pop out.
  */
  Widget _buildListCreator() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Material(
        color: Theme.of(context).cardColor,
        elevation: 10,
        child: TextField(
          controller: textController,
          decoration: InputDecoration(
            labelText: 'Add a plan',
            contentPadding: EdgeInsets.all(20)
          ),
          onEditingComplete: addPlan,
        ) 
      )
    );
  }

  /*
  The addPlan method will check whether the user actually typed something into the field and will then reset the screen
  */
  void addPlan() {
    final text = textController.text;
    if (text.isEmpty) {
      return;
    }

    final plan = Plan()..name = text;
    PlanProvider.of(context)?.add(plan);

    textController.clear();

    FocusScope.of(context).requestFocus(FocusNode());

    setState(() {});
  }


  /*
  We can create a ListView that will read the data from PlanProvider and print it onto the screen.
  This component will also be aware of its content and return the appropriate set of widgets.
  */
  Widget _buildMasterPlans() {
    final plans = PlanProvider.of(context);

    if (plans == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(Icons.note, size: 100, color: Colors.grey),
          Text(
            'You do not have any plans yet.',
            style: Theme.of(context).textTheme.headlineMedium
          )
        ]
      );
    }

    return ListView.builder(
      itemCount: plans.length,
      itemBuilder: (context, index) {
        final plan = plans[index];
        return ListTile(
          title: Text(plan.name),
          subtitle: Text(plan.completenessMessage),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PlanScreen(plan: plan)
              )
            );
          }
        );
      }
    );
  }


  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
}