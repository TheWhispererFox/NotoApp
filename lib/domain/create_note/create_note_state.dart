import 'package:built_value/built_value.dart';
import 'package:noto_app/data/models/note.dart';

part 'create_note_state.g.dart';

abstract class CreateNoteState
    implements Built<CreateNoteState, CreateNoteStateBuilder> {
  factory CreateNoteState([void Function(CreateNoteStateBuilder) updates]) =
      _$CreateNoteState;

  CreateNoteState._();

  factory CreateNoteState.initial(Note? note) {
    return CreateNoteState(
      (b) => b
        ..note = note?.toBuilder() ?? Note.empty().toBuilder()
        ..isRenderMode = true,
    );
  }

  Note get note;
  bool get isRenderMode;
}
