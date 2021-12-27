import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:noto_app/data/models/note.dart';

part 'notes_state.g.dart';

abstract class NotesState implements Built<NotesState, NotesStateBuilder> {
  factory NotesState([void Function(NotesStateBuilder) updates]) = _$NotesState;

  NotesState._();

  factory NotesState.initial() {
    return NotesState(
      (b) => b..selectedNotes = BuiltList<Note>().toBuilder(),
    );
  }

  BuiltList<Note> get selectedNotes;
}
