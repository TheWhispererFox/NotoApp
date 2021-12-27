import 'package:noto_app/app/locator.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:noto_app/domain/user/user_state.dart';
import 'package:noto_app/services/auth_service.dart';

class UserBloc extends Bloc<UserState, UserStateBuilder> {
  UserBloc() : super(UserState.initial());

  final AuthService _authService = locator.get();

  void passwordDontMatch() {
    updateState((b) => b.error = AuthError.passwordDontMatch);
  }

  Future<void> registerUserWithEmail(
    String email,
    String password,
  ) async {
    final result = await _authService.registerUserWithEmail(email, password);

    result.fold(
      (userCredential) {
        updateState(
          (b) => b
            ..userCredential = userCredential
            ..error = null,
        );
      },
      (authError) {
        updateState((b) => b.error = authError);
      },
    );
  }

  Future<void> signInWithEmail(
    String email,
    String password,
  ) async {
    final result = await _authService.signInWithEmail(email, password);
    result.fold((userCredential) {
      updateState(
        (b) => b
          ..userCredential = userCredential
          ..error = null,
      );
    }, (authError) {
      updateState((b) => b.error = authError);
    });
  }
}

// Future<UserCredential?> signInWithGoogle() async {
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   if (googleUser != null) {
//     final GoogleSignInAuthentication googleAuth =
//         await googleUser.authentication;

//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     return _auth.signInWithCredential(credential);
//   }
// }

// Future<void> signOut() async {
//   await _auth.signOut();
// }
