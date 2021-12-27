import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noto_app/base/bloc/bloc_test.dart';
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/domain/themes/theme_state.dart';

void main() {
  group('ThemeBloc tests', () {
    blocTest<ThemeBloc, ThemeState, ThemeStateBuilder>(
      'ThemeBloc theme switch test',
      build: () async => ThemeBloc(
        initTheme: ThemeMode.dark,
        onThemeChanged: (_) {},
      ),
      event: (bloc) async => bloc.setThemeMode(ThemeMode.light),
      expect: (state) => state.themeMode == ThemeMode.dark,
      timeout: Timeout.none,
    );
  });
}
