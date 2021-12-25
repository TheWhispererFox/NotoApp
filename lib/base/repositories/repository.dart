import 'package:built_collection/built_collection.dart';
import 'package:noto_app/base/types/entity.dart';

abstract class Repository<T extends Entity> {
  Stream<BuiltList<T>> get stream;

  Future<BuiltList<T>> get data;

  void dispose();

  Future<String> add(T model);

  Future<void> addOrUpdate(T model);

  Future<void> update(T model);

  Future<void> delete(T model);

  Future<T?> get(String id);

  Stream<T?> getStream(String id);
}
