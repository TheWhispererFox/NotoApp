import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

enum AuthError {
  unknown,
  weakPassword,
  emailAlreadyInUse,
  userNotFound,
  wrongPassword,
  passwordDontMatch,
}

@injectable
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<Either<UserCredential, AuthError>> registerUserWithEmail(
    String email,
    String password,
  ) async {
    try {
      return Left(
        await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Right(AuthError.weakPassword);
      } else if (e.code == 'email-already-in-use') {
        return const Right(AuthError.emailAlreadyInUse);
      } else {
        return const Right(AuthError.unknown);
      }
    }
  }

  Future<Either<UserCredential, AuthError>> signInWithEmail(
    String email,
    String password,
  ) async {
    try {
      return Left(
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Right(AuthError.userNotFound);
      } else if (e.code == 'wrong-password') {
        return const Right(AuthError.wrongPassword);
      } else {
        return const Right(AuthError.unknown);
      }
    }
  }

  Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return _auth.signInWithCredential(credential);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  bool isUserAuthentificated() {
    return _auth.currentUser != null;
  }
}
