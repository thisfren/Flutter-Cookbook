// lib/models/plan.dart
/*
 * We also need a plan that will hold all our tasks.
 */

import './task.dart';

class Plan {
  String name = '';
  final List<Task> tasks = [];

  int get completeCount => tasks
    .where((task) => task.complete)
    .length;

  String get completenessMessage =>
    '$completeCount out of ${tasks.length} tasks';
}