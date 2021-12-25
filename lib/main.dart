import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noto_app/app/app.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/firebase_options.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
}

Future<void> main() async {
  await initialize();
  runApp(App());
}
