import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:noto_app/base/types/entity.dart';

part 'note.g.dart';

abstract class Note implements Built<Note, NoteBuilder>, Entity {
  factory Note({
    required String content,
    required String title,
  }) {
    return _$Note((b) {
      initEntity(b);

      b
        ..title = title
        ..content = content;
    });
  }

  Note._();

  factory Note.empty() {
    return Note(content: '', title: 'Untitled');
  }

  static Serializer<Note> get serializer => _$noteSerializer;

  String? get title;

  String? get content;
}
