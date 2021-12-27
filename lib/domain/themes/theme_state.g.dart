// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_state.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ThemeState extends ThemeState {
  factory _$ThemeState([void Function(ThemeStateBuilder)? updates]) =>
      (new ThemeStateBuilder()..update(updates)).build();

  _$ThemeState._({required this.themeMode, required this.brightness})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(themeMode, 'ThemeState', 'themeMode');
    BuiltValueNullFieldError.checkNotNull(
        brightness, 'ThemeState', 'brightness');
  }

  @override
  final Brightness brightness;

  @override
  final ThemeMode themeMode;

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ThemeState &&
        themeMode == other.themeMode &&
        brightness == other.brightness;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, themeMode.hashCode), brightness.hashCode));
  }

  @override
  ThemeState rebuild(void Function(ThemeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ThemeStateBuilder toBuilder() => new ThemeStateBuilder()..replace(this);

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ThemeState')
          ..add('themeMode', themeMode)
          ..add('brightness', brightness))
        .toString();
  }
}

class ThemeStateBuilder implements Builder<ThemeState, ThemeStateBuilder> {
  ThemeStateBuilder();

  _$ThemeState? _$v;
  Brightness? _brightness;
  ThemeMode? _themeMode;

  @override
  void replace(ThemeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ThemeState;
  }

  @override
  void update(void Function(ThemeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  ThemeMode? get themeMode => _$this._themeMode;

  set themeMode(ThemeMode? themeMode) => _$this._themeMode = themeMode;

  Brightness? get brightness => _$this._brightness;

  set brightness(Brightness? brightness) => _$this._brightness = brightness;

  ThemeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _themeMode = $v.themeMode;
      _brightness = $v.brightness;
      _$v = null;
    }
    return this;
  }

  @override
  _$ThemeState build() {
    final _$result = _$v ??
        new _$ThemeState._(
            themeMode: BuiltValueNullFieldError.checkNotNull(
                themeMode, 'ThemeState', 'themeMode'),
            brightness: BuiltValueNullFieldError.checkNotNull(
                brightness, 'ThemeState', 'brightness'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
