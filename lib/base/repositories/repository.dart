import 'package:built_collection/built_collection.dart';

abstract class Repository<T> {
  Stream<BuiltList<T>> get stream;

  BuiltList<T> get data;

  void dispose() {}

  void add(T model) => throw UnimplementedError();
  void update(T model) => throw UnimplementedError();
  void remove(T model) => throw UnimplementedError();
}
