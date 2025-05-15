// lib/models/plan.dart
/*
 * We also need a plan that will hold all our tasks.
 */

import './task.dart';

class Plan {
  String name = '';
  final List<Task> tasks = [];
}