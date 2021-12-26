import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:noto_app/data/repositories/firestore/firestore_note_repository.dart';
import 'package:noto_app/domain/user/user_state.dart';

class UserBloc extends Bloc<UserState, UserStateBuilder> {
  UserBloc(User user) : super(UserState.initial(user));

  final FirestoreNoteRepository _userRepository = locator.get();

  //Stream<BuiltList<Note>> getNotes() => _noteRepository.stream;
  late final events = UserEvents(this);
}

class UserEvents {
  UserEvents(this._bloc);

  final UserBloc _bloc;

  void saveNote() {
    //_bloc._noteRepository.addOrUpdate(_bloc.state.user);
  }

  void deleteNote() {
    //_bloc._noteRepository.delete(_bloc.state.note);
  }
}
