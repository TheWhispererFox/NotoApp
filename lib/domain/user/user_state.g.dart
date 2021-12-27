// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserState extends UserState {
  factory _$UserState([void Function(UserStateBuilder)? updates]) =>
      (new UserStateBuilder()..update(updates)).build();

  _$UserState._({this.user, this.userCredential, this.error}) : super._();

  @override
  final AuthError? error;

  @override
  final User? user;

  @override
  final UserCredential? userCredential;

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserState &&
        user == other.user &&
        userCredential == other.userCredential &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, user.hashCode), userCredential.hashCode), error.hashCode));
  }

  @override
  UserState rebuild(void Function(UserStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserStateBuilder toBuilder() => new UserStateBuilder()..replace(this);

  @override
  String toString() {
    return (newBuiltValueToStringHelper('UserState')
          ..add('user', user)
          ..add('userCredential', userCredential)
          ..add('error', error))
        .toString();
  }
}

class UserStateBuilder implements Builder<UserState, UserStateBuilder> {
  UserStateBuilder();

  _$UserState? _$v;
  AuthError? _error;
  User? _user;
  UserCredential? _userCredential;

  @override
  void replace(UserState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserState;
  }

  @override
  void update(void Function(UserStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  User? get user => _$this._user;

  set user(User? user) => _$this._user = user;

  UserCredential? get userCredential => _$this._userCredential;

  set userCredential(UserCredential? userCredential) =>
      _$this._userCredential = userCredential;

  AuthError? get error => _$this._error;

  set error(AuthError? error) => _$this._error = error;

  UserStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _userCredential = $v.userCredential;
      _error = $v.error;
      _$v = null;
    }
    return this;
  }

  @override
  _$UserState build() {
    final _$result = _$v ??
        new _$UserState._(
            user: user, userCredential: userCredential, error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
