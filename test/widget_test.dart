// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:noto_app/base/bloc/bloc_state_test.dart';
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/domain/themes/theme_state.dart';
import 'package:noto_app/main.dart';
import 'package:noto_app/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('CounterBloc tests', () {
    blocStateTest<ThemeBloc, ThemeState, ThemeStateBuilder>(
      'ThemeBloc theme switch test',
      build: () async => ThemeBloc(
        preferencesService: PreferencesService(
          await SharedPreferences.getInstance(),
        ),
      ),
      event: (bloc) async => bloc.setThemeMode(ThemeMode.light),
      expect: (state) => state.themeMode == ThemeMode.light,
    );
  });

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(App());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
