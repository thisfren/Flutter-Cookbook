// lib/repositories/repository.dart
/*
 * Let's define a repository interface and then implement a version of that interface as an in-memory cache.
 * Designing this sort of structure allows you to, in theory, have multiple implementations of the repository interface that can be swapped in and out effortlessly.
 * In fact, this same abstract class could be used to store data in a database, in one or more files, or in a RESTful web service.
 * In this recipe, we chose to implement the simplest option, InMemoryCache, which is nothing more than a fancy Map.
 * The interesting thing about this class is that it represents a unified interface that can be used regardless of the actual destination of the data.
 */

abstract class Repository {
  Model create();

  List<Model> getAll();
  Model get(int id);

  void update(Model item);

  void delete(Model item);
  void clear();
}

/*
We also need to define a temporary storage class called Model that can be used in any implementation of our repository interface.
Since this model is strongly coupled to the repository concept, we can add it to the same file.
*/
class Model {
  final int id;
  final Map data;

  const Model({
    required this.id,
    this.data = const {}
  });
}