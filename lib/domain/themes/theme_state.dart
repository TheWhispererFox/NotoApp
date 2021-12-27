import 'package:built_value/built_value.dart';
import 'package:flutter/material.dart' hide Builder;

part 'theme_state.g.dart';

abstract class ThemeState implements Built<ThemeState, ThemeStateBuilder> {
  factory ThemeState([
    void Function(ThemeStateBuilder) updates,
  ]) = _$ThemeState;

  ThemeState._();

  factory ThemeState.initial(ThemeMode themeMode) {
    return ThemeState(
      (b) => b
        ..themeMode = themeMode
        ..brightness = Brightness.light,
    );
  }

  ThemeMode get themeMode;

  Brightness get brightness;
}
