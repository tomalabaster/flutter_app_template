abstract class IRepository<T> {
  Future<T> getById(int id);
  Future<Iterable<T>> getAll();
  Future<Iterable<T>> getAllWhere(bool Function(T) predicate);
  Future<T> add(T object);
  Future<T> update(T object);
  Future<T> delete(T object);
}
