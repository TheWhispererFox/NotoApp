import 'package:built_value/built_value.dart';

part 'entity.g.dart';

@BuiltValue(instantiable: false)
abstract class Entity {
  String get id;
  DateTime get createdAt;
  DateTime get updatedAt;
  DateTime? get deletedAt;
}

extension EntityExtension on Entity {
  bool get isDeleted => deletedAt != null;
  bool get isNotDeleted => !isDeleted;
}
