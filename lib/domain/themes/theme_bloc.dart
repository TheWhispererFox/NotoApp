import 'package:flutter/material.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/base/bloc/bloc.dart';

import 'package:noto_app/domain/themes/theme_state.dart';
import 'package:noto_app/services/preferences_service.dart';

class ThemeEvents {
  ThemeEvents(this._bloc);

  final ThemeBloc _bloc;

  void setThemeMode(ThemeMode themeMode) {
    _bloc.updateState((b) => b..themeMode = themeMode);
    _bloc._preferencesService.darkMode = themeMode == ThemeMode.dark;
  }

  void setBrightness(Brightness brightness) {
    _bloc.updateState((b) => b..brightness = brightness);
  }

  void switchTheme() {
    if (_bloc.state.themeMode == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }
}

class ThemeBloc extends Bloc<ThemeState, ThemeStateBuilder> {
  late final PreferencesService _preferencesService;

  ThemeBloc() : super(ThemeState.initial()) {
    _preferencesService = locator.get();

    events.setThemeMode(
      _preferencesService.darkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }

  late final events = ThemeEvents(this);
}
