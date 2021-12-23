import 'package:built_collection/built_collection.dart';
import 'package:noto_app/base/types/entity.dart';

abstract class Repository<T extends Entity> {
  Stream<BuiltList<T>> get stream;

  BuiltList<T> get data;

  void dispose() {}

  void add(T model) => throw UnimplementedError();
  void update(T model) => throw UnimplementedError();
  void remove(T model) => throw UnimplementedError();
}
