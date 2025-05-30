// lib/views/plan_screen.dart

import 'package:flutter/material.dart' show PopScope, AppBar, BuildContext, Checkbox, Colors, Column, Container, DismissDirection, Dismissible, Expanded, FloatingActionButton, FocusNode, FocusScope, Icon, Icons, ListTile, ListView, SafeArea, Scaffold, ScrollController, State, StatefulWidget, Text, TextFormField, ValueKey, Widget;
import 'package:master_plan/plan_provider.dart';
// import 'package:master_plan/plan_provider.dart' show PlanProvider;

import '../models/data_layer.dart';


class PlanScreen extends StatefulWidget {
  final Plan plan;
  
  const PlanScreen({
    super.key,
    required this.plan
  });

  @override
  State createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  Plan get plan => widget.plan;
  // final plan = Plan();
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
    // final plan = PlanProvider.of(context);

    /*
    When a user dismisses a PlanScreen, the data should be synchronized with our storage solution.
    Flutter has a widget called WillPopScope that allows you to run arbitrary code when routes are dismissed.
    */
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) { // Correct parameter name and callback signature
        // This callback is invoked after the pop attempt.
        // didPop will be true if the pop is proceeding.
        if (didPop) {
          final controller = PlanProvider.of(context);
          controller.savePlan(plan);
        }
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Master Plan')),
        body: Column(
          children: [
            Expanded(
              child :_buildList()
            ),
            SafeArea(
              // child: Text(plan!.completenessMessage)
              child: Text(plan.completenessMessage)
            )
          ],
        ),
        floatingActionButton: _buildAddTaskButton()
      ),
    );
  }

  Widget _buildAddTaskButton() {
    // final plan = PlanProvider.of(context);

    return FloatingActionButton(
      onPressed: () {
        final controller = PlanProvider.of(context);
        controller.addNewTask(plan);
        setState(() {});
        /* Move business logic to controller and provider
        setState(() {
          // plan!.tasks.add(Task());
          plan.tasks.add(Task());
        });
        */
      },
      child: Icon(Icons.add)
    );
  }

  Widget _buildList() {
    // final plan = PlanProvider.of(context);

    return ListView.builder( // The ListView widget (the view) queries the Plan class (the model) to figure out how many items there are
      controller: scrollController,
      // itemCount: plan!.tasks.length,
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
    return Dismissible(
      key: ValueKey(task),
      background: Container(color: Colors.red),
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        final controller = PlanProvider.of(context);
        controller.deleteTask(plan, task);
        setState(() {});
      },
      child: ListTile(
        leading: Checkbox(
          value: task.complete,
          onChanged: (selected) {
            setState(() {
              task.complete = selected!;
            });
          }
        ),
        title: TextFormField(
          initialValue: task.description,
          onFieldSubmitted: (text) {
            setState(() {
              task.description = text;
            });
          }
        )
      /*
        title: TextField(
          onChanged: (text) {
            setState(() {
              task.description = text;
            });
          }
        )
      */
      ),
    );
  }

  @override
  void dispose() {
    scrollController.dispose(); // Dispose of scrollController when the widget is removed from the tree
    super.dispose();
  }
}