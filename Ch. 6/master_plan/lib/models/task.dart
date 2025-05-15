// lib/models/task.dart
/*
 * This class will hold the task data for our app.
 */

class Task {
  String description;
  bool complete;

  Task({
    this.description = '',
    this.complete = false
  });
}