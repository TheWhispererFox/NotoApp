import 'package:built_value/built_value.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:noto_app/services/auth_service.dart';

part 'user_state.g.dart';

abstract class UserState implements Built<UserState, UserStateBuilder> {
  factory UserState([void Function(UserStateBuilder) updates]) = _$UserState;

  UserState._();

  factory UserState.initial() {
    return UserState(
      (b) => b
        ..user = null
        ..userCredential = null
        ..error = null,
    );
  }

  User? get user;

  UserCredential? get userCredential;

  AuthError? get error;
}
