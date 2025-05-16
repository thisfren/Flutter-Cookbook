// lib/controllers/plan_controller.dart
/*
 * This class will be responsible for all the business logic in our app.
 */

import '../models/data_layer.dart';
import '../services/plan_services.dart';


class PlanController {
  final services = PlanServices(); // Remove the controller's private _plans property and replace it with the service
  // final _plans = <Plan>[];

  List<Plan> get plans => List.unmodifiable(services.getAllPlans()); // This public getter cannot be modified by any other object

  /*
  We can use our business logic to check the naming input for new plans.
  */
  void addNewPlan(String name) {
    if (name.isEmpty) {
      return;
    }

    name = _checkForDuplicates(plans.map((plan) => plan.name), name);

    services.createPlan(name);
    /*
    final plan = Plan()..name = name;
    _plans.add(plan);
    */
  }

  /*
  Also add the methods for saving and deleting a plan.
  */
  void savePlan(Plan plan) {
    services.savePlan(plan);
  }

  void deletePlan(Plan plan) {
    services.delete(plan);
    //_plans.remove(plan);
  }

  /*
  Similarly, adding and deleting for tasks:
  */
  void addNewTask(Plan plan, [String? description]) {
    if (description == null || description.isEmpty) {
      description = 'New Task';
    }

    description = _checkForDuplicates(plan.tasks.map((task) => task.description), description);

    services.addTask(plan, description);
    /*
    final task = Task()..description = description;
    plan.tasks.add(task);
    */
  }

  void deleteTask(Plan plan, Task task) {
    services.deleteTask(plan, task);
    // plan.tasks.remove(task);
  }

  /*
  First, create a private method that will check a list of items and search for duplicate names.
  If it finds any, a number will be appended to the end to make sure the name is unique.
  */
  String _checkForDuplicates(Iterable<String> items, String text) {
    final duplicatedCount = items.where((item) => item.contains(text)).length;

    if (duplicatedCount > 0) {
      text += ' ${duplicatedCount + 1}';
    }

    return text;
  }
}

