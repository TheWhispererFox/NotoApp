import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:noto_app/base/types/entity.dart';
import 'package:noto_app/data/models/note.dart';

part 'serializers.g.dart';

@SerializersFor([
  Entity,
  Note,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();

T? deserialize<T>(dynamic value) {
  final serializer = serializers.serializerForType(T) as Serializer<T>?;

  if (serializer != null) {
    return serializers.deserializeWith<T>(
      serializer,
      value,
    );
  }
}

Object? serialize<T>(T value) {
  final serializer = serializers.serializerForType(T) as Serializer<T>?;

  if (serializer != null) {
    return serializers.serializeWith(
      serializer,
      value,
    );
  }
}

List<T> deserializeIterable<T>(Iterable<Map<dynamic, dynamic>> value) => value
    .map((value) => deserialize<T>(value))
    .whereType<T>()
    .toList(growable: false);

List<Object> serializeIterable<T>(Iterable<T> value) {
  return value
      .map((value) => serialize<T>(value))
      .whereType<Object>()
      .toList(growable: false);
}
