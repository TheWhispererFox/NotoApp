import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:noto_app/domain/user/user_state.dart';

class UserBloc extends Bloc<UserState, UserStateBuilder> {
  UserBloc(User user) : super(UserState.initial(user));

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
      final UserCredential userCredential = await _bloc._auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // Notify user that his password is weak
      } else if (e.code == 'email-already-in-use') {
        // Notify user that this email already registered
      }
    }
  }

  Future<void> authUserWithEmail(String email, String password) async {
    try {
      final UserCredential userCredential = await _bloc._auth
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Notify user that this account isn't Found
      } else if (e.code == 'wrong-password') {
        // Notify user that they wrote wrong password
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
