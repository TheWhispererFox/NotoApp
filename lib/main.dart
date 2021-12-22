import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:noto_app/app/app.dart';
import 'package:noto_app/app/locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  configureDependencies();

  runApp(App());
}
