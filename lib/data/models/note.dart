import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:noto_app/base/types/entity.dart';
import 'package:noto_app/utils/uuid.dart';

part 'note.g.dart';

abstract class Note implements Entity, Built<Note, NoteBuilder> {
  factory Note({
    required String content,
    required String title,
  }) {
    return _$Note(
      (b) => b
        ..id = genUuid()
        ..createdAt = DateTime.now()
        ..updatedAt = DateTime.now()
        ..title = title
        ..content = content,
    );
  }

  Note._();

  static Serializer<Note> get serializer => _$noteSerializer;

  String? get title;

  String? get content;
}
