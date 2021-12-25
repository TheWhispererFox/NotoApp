import 'package:built_collection/built_collection.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/data/repositories/firestore/firestore_note_repository.dart';
import 'package:noto_app/domain/create_note/create_note_state.dart';

class CreateNoteBloc extends Bloc<CreateNoteState, CreateNoteStateBuilder> {
  CreateNoteBloc(Note? note) : super(CreateNoteState.initial(note));

  final FirestoreNoteRepository _noteRepository = locator.get();

  Stream<BuiltList<Note>> getNotes() => _noteRepository.stream;
  late final events = NotesEvents(this);
}

class NotesEvents {
  NotesEvents(this._bloc);

  final CreateNoteBloc _bloc;

  saveNote() {
    //TODO: Save note to repository
  }
}
