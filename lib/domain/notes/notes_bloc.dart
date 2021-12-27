import 'package:built_collection/built_collection.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/data/repositories/firestore/firestore_note_repository.dart';
import 'package:noto_app/domain/notes/notes_state.dart';

class NotesBloc extends Bloc<NotesState, NotesStateBuilder> {
  NotesBloc() : super(NotesState.initial());

  bool isSelected(Note note) {
    return state.selectedNotes.contains(note);
  }

  bool get isInSelectionMode {
    return state.selectedNotes.isNotEmpty;
  }

  final FirestoreNoteRepository _noteRepository = locator.get();

  Stream<BuiltList<Note>> getNotes() => _noteRepository.stream;

  void select(Note note) {
    if (!isSelected(note)) {
      return updateState((b) => b..selectedNotes.add(note));
    } else {
      return updateState((b) => b..selectedNotes.remove(note));
    }
  }

  void removeAllSelectedNotes() {
    for (final note in state.selectedNotes) {
      _noteRepository.delete(note);
    }

    unselectAll();
  }

  void unselectAll() {
    updateState((b) => b.selectedNotes = ListBuilder<Note>());
  }
}
