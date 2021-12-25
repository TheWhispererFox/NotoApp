import 'package:flutter/material.dart';
import 'package:noto_app/ui/components/round_underline_tab_indicator.dart';

final dark = ThemeData.dark().copyWith(
  splashFactory: NoSplash.splashFactory,
  cardColor: const Color(0xFF262635),
  backgroundColor: const Color(0xff6f70c2),
  tabBarTheme: const TabBarTheme(
    unselectedLabelColor: Color(0xFF868591),
    labelColor: Color(0xFFf3c060),
    indicator: RoundUnderlineTabIndicator(
      borderSide: BorderSide(color: Color(0xFFF3C060), width: 5),
    ),
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(fontFamily: 'Roboto'),
    unselectedLabelStyle: TextStyle(fontFamily: 'Roboto'),
  ),
);

final light = ThemeData.light().copyWith(
  splashFactory: NoSplash.splashFactory,
);
