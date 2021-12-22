import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:uuid/uuid.dart';

part 'note.g.dart';

abstract class Note implements Built<Note, NoteBuilder> {
  static Serializer<Note> get serializer => _$noteSerializer;

  String get id;

  String? get title;

  String? get content;

  DateTime get createdAt;

  Note._();
  //factory Note([void Function(NoteBuilder) updates]) = _$Note;
  factory Note({
    required String content,
    required String title,
  }) {
    return _$Note(
      (b) => b
        ..id = const Uuid().v4()
        ..title = title
        ..content = content
        ..createdAt = DateTime.now(),
    );
  }
}
