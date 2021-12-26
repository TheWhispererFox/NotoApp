import 'package:built_collection/built_collection.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:noto_app/data/models/note.dart';
import 'package:noto_app/data/repositories/firestore/firestore_note_repository.dart';
import 'package:noto_app/domain/notes/notes_state.dart';

class NotesEvents {
  NotesEvents(this._bloc);

  final NotesBloc _bloc;

  void select(Note note) {
    if (!_bloc.isSelected(note)) {
      return _bloc.updateState((b) => b..selectedNotes.add(note));
    } else {
      return _bloc.updateState((b) => b..selectedNotes.remove(note));
    }
  }

  void removeAllSelectedNotes() {
    for (final note in _bloc.state.selectedNotes) {
      _bloc._noteRepository.delete(note);
    }
  }
}

class NotesBloc extends Bloc<NotesState, NotesStateBuilder> {
  NotesBloc() : super(NotesState.initial());

  bool isSelected(Note note) {
    return state.selectedNotes.contains(note);
  }

  late final events = NotesEvents(this);

  final FirestoreNoteRepository _noteRepository = locator.get();

  Stream<BuiltList<Note>> getNotes() => _noteRepository.stream;
}
