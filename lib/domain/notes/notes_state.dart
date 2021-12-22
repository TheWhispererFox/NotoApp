import 'package:built_value/built_value.dart';

part 'notes_state.g.dart';

abstract class NotesState implements Built<NotesState, NotesStateBuilder> {
  NotesState._();
  factory NotesState([void Function(NotesStateBuilder) updates]) = _$NotesState;
}