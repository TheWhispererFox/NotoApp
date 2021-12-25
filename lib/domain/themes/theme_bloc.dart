import 'package:flutter/material.dart';
import 'package:noto_app/base/bloc/bloc.dart';

import 'package:noto_app/domain/themes/theme_state.dart';

class ThemeEvents {
  ThemeEvents(this.bloc);

  final ThemeBloc bloc;

  void setThemeMode(ThemeMode themeMode) {
    bloc.updateState((b) => b..themeMode = themeMode);
  }

  void setBrightness(Brightness brightness) {
    bloc.updateState((b) => b..brightness = brightness);
  }

  void switchTheme() {
    if (bloc.state.themeMode == ThemeMode.dark) {
      setThemeMode(ThemeMode.light);
    } else {
      setThemeMode(ThemeMode.dark);
    }
  }
}

class ThemeBloc extends Bloc<ThemeState, ThemeStateBuilder> {
  ThemeBloc() : super(ThemeState.initial());

  late final events = ThemeEvents(this);
}
