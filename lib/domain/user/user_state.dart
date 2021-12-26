import 'package:built_value/built_value.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'user_state.g.dart';

abstract class UserState implements Built<UserState, UserStateBuilder> {
  factory UserState([void Function(UserStateBuilder) updates]) = _$UserState;

  UserState._();

  factory UserState.initial(User user) {
    return UserState(
      (b) => b..user = user,
    );
  }

  User get user;
}
