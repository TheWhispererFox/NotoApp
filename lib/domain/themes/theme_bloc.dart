import 'package:flutter/material.dart';
import 'package:noto_app/base/bloc/bloc.dart';

import 'package:noto_app/domain/themes/theme_state.dart';

class ThemeBloc extends Bloc<ThemeState, ThemeStateBuilder> {
  final ThemeMode initialThemeMode;
  final void Function(ThemeMode theme) onThemeChanged;

  ThemeBloc({
    required this.initialThemeMode,
    required this.onThemeChanged,
  }) : super(ThemeState.initial(), debug: true) {
    setThemeMode(
      initialThemeMode,
    );
  }

  void setThemeMode(ThemeMode themeMode) {
    updateState((b) => b..themeMode = themeMode);
    onThemeChanged(themeMode);
  }

  void setBrightness(Brightness brightness) {
    updateState((b) => b..brightness = brightness);
  }

  void switchTheme() {
    if (state.themeMode == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }
}
