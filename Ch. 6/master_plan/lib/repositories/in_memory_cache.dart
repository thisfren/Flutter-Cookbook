// lib/repositories/in_memory_cache.dart
/*
 * The respository interface can be implemented in several ways, but for the sake of simplicity we are just going to implement an in-memory cache.
 */

import 'repository.dart';


class InMemoryCache implements Repository {
  final _storage = Map<int, Model>();

  /*
  The most complex method is the create function, 
  which needs to generate a unique identifier for every element in the storage.
  Keys in Maps are not stored in any particular order. To find out what the largest value is, we need to sort all the keys in the map. 
  Once we've retrieved the largest number, the function will just return that value incremented by one.
  This only works because the repository layer controls the id property. It should be a read-only value for any layer higher than the repository.
  */
  @override
  Model create() {
    final ids = _storage.keys.toList()..sort();
    final id = (ids.isEmpty) ? 1 : ids.last + 1;

    final model = Model(id: id);
    _storage[id] = model;
    
    return model;
  }

  /*
  The remaining methods are simple wrappers of the map API.
  */ 

  @override
  Model get(int id) {
    final model = _storage[id];

    if (model == null) { 
      throw ArgumentError('Model with id $id not found.');
    }

    return model;
  }
  
  @override
  List<Model> getAll() {
    return _storage.values.toList(growable: false);
  }
  
  @override
  void update(Model item) {
    _storage[item.id] = item;
  }
  
  @override
  void delete(Model item) {
    _storage.remove(item.id);
  }

  @override
  void clear() {
    _storage.clear();
  }
}