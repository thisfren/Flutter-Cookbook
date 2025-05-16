// lib/services/plan_services.dart
/*
 * All the hard work of transforming plans has already been completed in the models.
 * Now, we just need to expose the Create, Read, Update, and Delete (CRUD) methods in the services class.
 * The service class pipes the data from the controller down to the repository.
 * This is a relatively simple job, which means that the service classes should be simple to understand.
 * There is no business logic in these classes and they are not responsible for maintaining state; it's just about unidirectionally transforming data.
 */
import '../repositories/in_memory_cache.dart';
import '../repositories/repository.dart';
import '../models/data_layer.dart';

class PlanServices {
  /*
  By explicitly declaring this property as a Repository, we are saying that it doesn't matter that we're using an InMemoryCache.
  */
  final Repository _repository = InMemoryCache();

  Plan createPlan(String name) {
    final model = _repository.create();
    final plan = Plan.fromModel(model)..name = name;

    savePlan(plan);

    return plan;
  }

  void savePlan(Plan plan) {
    _repository.update(plan.toModel());
  }

  void delete(Plan plan) {
    _repository.delete(plan.toModel());
  }

  List<Plan> getAllPlans() {
    return _repository
      .getAll()
      .map<Plan>((model) => Plan.fromModel(model))
      .toList();
  }


  /*
  Integrating Tasks into the services layer is a bit easier. 
  These objects are strongly coupled to their parent Plan objects.
  We just want to ensure that the tasks always have a unique id.
  */
  void addTask(Plan plan, String description) {
    final int id;
    if (plan.tasks.isEmpty) {
      id = 1; // Start with ID 1 if no tasks exist
    } else {
      id = plan.tasks.last.id + 1;
    }
    final task = Task(id: id, description: description);

    plan.tasks.add(task);
    savePlan(plan);
  }

  void deleteTask(Plan plan, Task task) {
    plan.tasks.remove(task);
    savePlan(plan);
  }
}