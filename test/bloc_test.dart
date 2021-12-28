import 'package:built_rx_bloc_test/built_rx_bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/domain/themes/theme_state.dart';

void main() {
  group('ThemeBloc tests', () {
    blocTest<ThemeBloc, ThemeState, ThemeStateBuilder>(
      'ThemeBloc theme switch test',
      build: () async => ThemeBloc(
        initialThemeMode: ThemeMode.light,
        onThemeModeChanged: (_) {},
      ),
      skip: 0,
      event: (bloc) async => bloc.setThemeMode(ThemeMode.dark),
      statePredicates: [
        (state) => state.themeMode == ThemeMode.light,
        (state) => state.themeMode == ThemeMode.dark,
      ],
      timeout: Timeout.none,
    );
  });
}
