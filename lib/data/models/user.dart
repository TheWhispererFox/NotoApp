import 'package:built_value/built_value.dart';
import 'package:noto_app/base/types/entity.dart';

part 'user.g.dart';

abstract class User implements Built<User, UserBuilder>, Entity {
  factory User({
    required String email,
    required String password,
  }) {
    return _$User((b) {
      initEntity(b);

      b
        ..email = email
        ..password = password;
    });
  }

  factory User.empty() {
    return User(email: '', password: 'Untitled');
  }

  User._();

  String? get email;

  String? get password;
}
