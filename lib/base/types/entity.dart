import 'package:built_value/built_value.dart';
import 'package:noto_app/utils/uuid.dart';
import 'package:uuid/uuid.dart';

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
