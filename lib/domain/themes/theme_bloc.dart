import 'package:flutter/material.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/base/bloc/bloc.dart';

import 'package:noto_app/domain/themes/theme_state.dart';
import 'package:noto_app/services/preferences_service.dart';

class ThemeBloc extends Bloc<ThemeState, ThemeStateBuilder> {
  late final PreferencesService _preferencesService;

  ThemeBloc() : super(ThemeState.initial()) {
    _preferencesService = locator.get();

    setThemeMode(
      _preferencesService.darkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }

  void setThemeMode(ThemeMode themeMode) {
    updateState((b) => b..themeMode = themeMode);
    _preferencesService.darkMode = themeMode == ThemeMode.dark;
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
