import 'package:built_collection/built_collection.dart';
import 'package:noto_app/base/types/entity.dart';

abstract class Repository<T extends Entity> {
  Stream<BuiltList<T>> get stream;

  BuiltList<T> get data;

  void dispose();

  void add(T model);

  void update(T model);

  void delete(T model);
}
