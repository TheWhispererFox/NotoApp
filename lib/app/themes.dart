import 'package:flutter/material.dart';

final dark = ThemeData.dark().copyWith(
  splashFactory: NoSplash.splashFactory,
  cardColor: const Color(0xFF262635),
  backgroundColor: const Color(0xff6f70c2),
  textTheme: const TextTheme(
    headline1: TextStyle(
      fontFamily: 'MontserratAlternates',
    ),
  ),
);
