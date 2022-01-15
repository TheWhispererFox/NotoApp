import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_langs.dart';
import 'package:monarch_annotations/monarch_annotations.dart';
import 'package:noto_app/app/app.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/firebase_options.dart';
import 'package:noto_app/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

@MonarchLocalizations([MonarchLocale('en'), MonarchLocale('ru')])
const delegate = AppLocalizations.delegate;

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  locator.registerSingleton(
    PreferencesService(
      await SharedPreferences.getInstance(),
    ),
  );

  configureDependencies();
}

Future<void> main() async {
  await initialize();
  runApp(App());
}
