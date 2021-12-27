import 'package:noto_app/app/locator.dart';
import 'package:noto_app/base/bloc/bloc.dart';
import 'package:noto_app/domain/user/user_state.dart';
import 'package:noto_app/services/auth_service.dart';

class UserBloc extends Bloc<UserState, UserStateBuilder> {
  UserBloc() : super(UserState.initial());

  final AuthService _authService = locator.get();

  late final events = UserEvents(this);
}

class UserEvents {
  UserEvents(this._bloc);

  final UserBloc _bloc;

  void passwordDontMatch() {
    _bloc.updateState((b) => b.error = AuthError.passwordDontMatch);
  }

  Future<void> registerUserWithEmail(
    String email,
    String password,
  ) async {
    final result =
        await _bloc._authService.registerUserWithEmail(email, password);

    result.fold(
      (userCredential) {
        _bloc.updateState(
          (b) => b
            ..userCredential = userCredential
            ..error = null,
        );
      },
      (authError) {
        _bloc.updateState((b) => b.error = authError);
      },
    );
  }

  Future<void> signInWithEmail(
    String email,
    String password,
  ) async {
    await _bloc._authService.signInWithEmail(email, password);
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
}
