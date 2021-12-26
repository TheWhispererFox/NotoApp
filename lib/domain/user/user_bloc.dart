import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:noto_app/domain/user/user_state.dart';

class UserBloc extends Bloc<UserState, UserStateBuilder> {
  UserBloc(User? user) : super(UserState.initial(user));

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user {
    return _auth.currentUser;
  }

  //Stream<BuiltList<Note>> getNotes() => _noteRepository.stream;
  late final events = UserEvents(this);
}

class UserEvents {
  UserEvents(this._bloc);

  final UserBloc _bloc;

  Future<void> registerUserWithEmail(String email, String password) async {
    try {
      await _bloc._auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _bloc.updateState((b) => b.error = ErrorCode.weakPassword);
      } else if (e.code == 'email-already-in-use') {
        _bloc.updateState((b) => b.error = ErrorCode.emailAlreadyInUse);
      }
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      await _bloc._auth
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _bloc.updateState((b) => b.error = ErrorCode.userNotFound);
      } else if (e.code == 'wrong-password') {
        _bloc.updateState((b) => b.error = ErrorCode.wrongPassword);
      }
    }
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await _bloc._auth.signInWithCredential(credential);
  }

  Future<void> signOut() async {
    await _bloc._auth.signOut();
  }
}
