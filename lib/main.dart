import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noto_app/app/app.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';

Future<void> initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  locator.registerSingleton<AppRouter>(AppRouter());
  configureDependencies();
}

Future<void> main() async {
  await initialize();
  runApp(App());
}
