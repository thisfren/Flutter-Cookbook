// lib/views/plan_screen.dart

import 'package:flutter/material.dart' show AppBar, BuildContext, Checkbox, FloatingActionButton, FocusNode, FocusScope, Icon, Icons, ListTile, ListView, Scaffold, ScrollController, State, StatefulWidget, Text, TextField, Widget;

import '../models/data_layer.dart';


class PlanScreen extends StatefulWidget {
  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final plan = Plan();
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController() // You can use a ScrollController to remove the focus from any TextField during a scroll event
      ..addListener(() {
        FocusScope.of(context).requestFocus(FocusNode());
      });
  } 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Master Plan')),
      body: _buildList(),
      floatingActionButton: _buildAddTaskButton()
    );
  }

  Widget _buildAddTaskButton() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {
          plan.tasks.add(Task());
        });
      },
      child: Icon(Icons.add)
    );
  }

  Widget _buildList() {
    return ListView.builder( // The ListView widget (the view) queries the Plan class (the model) to figure out how many items there are
      controller: scrollController,
      itemCount: plan.tasks.length,
      /*
      In the itemBuilder closure, we extract the specific Task that matches the item index and pass the entire model to the buildTaskTile method.
      */
      itemBuilder: (context, index) => _buildTaskTile(plan.tasks[index])
    );
  }

  /*
  If you look at our implementation of the Checkbox widget, you'll see that it takes data from the model and then returns data to the model when its state changes.
  When building the UI for each individual task, the State of these widgets is owned by the model.
  The UI's job is to query the model for its current state and draw itself accordingly.
  */
  Widget _buildTaskTile(Task task) {
    return ListTile(
      leading: Checkbox(
        value: task.complete,
        onChanged: (selected) {
          setState(() {
            task.complete = selected!;
          });
        }
      ),
      title: TextField(
        onChanged: (text) {
          setState(() {
            task.description = text;
          });
        }
      )
    );
  }

  @override
  void dispose() {
    scrollController.dispose(); // Dispose of scrollController when the widget is removed from the tree
    super.dispose();
  }
}