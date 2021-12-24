import 'package:built_collection/built_collection.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/data/repositories/firestore/firestore_note_repository.dart';
import 'package:noto_app/domain/notes/notes_state.dart';

class NotesBloc extends Bloc<NotesState, NotesStateBuilder> {
  NotesBloc() : super(NotesState());

  final FirestoreNoteRepository _noteRepository = locator.get();

  Stream<BuiltList<Note>> getNotes() => _noteRepository.stream;
}
