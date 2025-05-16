// lib/models/plan.dart
/*
 * We also need a plan that will hold all our tasks.
 */

import './task.dart';
import '../repositories/repository.dart';


class Plan {
  final int id;
  String name = '';
  List<Task> tasks = [];

  Plan({
    required this.id,
  });

  int get completeCount => tasks
    .where((task) => task.complete)
    .length;

  String get completenessMessage =>
    '$completeCount out of ${tasks.length} tasks';

  /*
  The opposite process, deserialization, takes the data coming from the transient structure and instantiates a strongly typed model.
  Deserialization methods are often implemented as constructors to make the API easier to work with.
  */
  Plan.fromModel(Model model) // Deserialization constructor
    : id = model.id,
      name = model.data['name'] ?? '',
      tasks = model.data['task']
                    ?.map<Task>((task) => Task.fromModel(task))
                    ?.toList()
                    ?? <Task>[];

  /*
  Serialization is defined as the process of taking your data and transforming it into a type that's more appropriate for transportation.
  This could be a byte stream, JSON, XML, or in the case of this recipe, a Model.
  Serialization methods are typically named by prefacing them with the word to and then listing the type.
  This function takes the content to Task and generates a Map with key-value pairs representing the content.
  */
  Model toModel() => Model(id: id, data: { // Sertialization method
    'name': name,
    'tasks': tasks.map((task) => task.toModel()).toList()
  });
}