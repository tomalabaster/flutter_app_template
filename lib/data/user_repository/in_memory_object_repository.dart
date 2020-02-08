import 'package:flutter_app_template/data/irepository.dart';

class InMemoryObjectRepository implements IRepository<Object> {
  final List<Object> _objects = [];

  @override
  Future<Object> add(Object object) {
    this._objects.add(object);

    return Future.value(object);
  }

  @override
  Future<Object> delete(Object object) {
    this._objects.remove(object);

    return Future.value(object);
  }

  @override
  Future<Iterable<Object>> getAll() {
    return Future.value(this._objects);
  }

  @override
  Future<Iterable<Object>> getAllWhere(bool Function(Object) predicate) {
    return Future.value(this._objects.where(predicate));
  }

  @override
  Future<Object> getById(int id) {
    return Future.value(this._objects[id]);
  }

  @override
  Future<Object> update(Object object) {
    this._objects.remove(object);
    this._objects.add(object);

    return Future.value(object);
  }
}
