import 'package:flutter/material.dart';
import 'package:noto_app/ui/components/round_underline_tab_indicator.dart';

const _primaryColor = Color(0xFFbb86fc);
const _primaryColorDark = Color(0xFF9B4BFD);
const _secondaryColor = Color(0xFF03dac5);

final dark = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: Colors.grey.shade900,
  colorScheme: const ColorScheme.dark(
    primary: _primaryColor,
    secondary: _secondaryColor,
    secondaryVariant: Color(0xFF3700b3),
  ),
  splashFactory: NoSplash.splashFactory,
  cardColor: const Color(0xFF1e1e1e),
  backgroundColor: const Color(0xFF282828),
  tabBarTheme: const TabBarTheme(
    labelColor: _primaryColor,
    indicator: RoundUnderlineTabIndicator(
      borderSide: BorderSide(color: _primaryColor, width: 5),
    ),
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(fontFamily: 'Roboto'),
    unselectedLabelStyle: TextStyle(fontFamily: 'Roboto'),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: _primaryColor,
  ),
);

final light = ThemeData.light().copyWith(
  splashFactory: NoSplash.splashFactory,
  colorScheme: const ColorScheme.light(
    primary: _primaryColorDark,
    secondary: _secondaryColor,
    secondaryVariant: Color(0xFF3700b3),
  ),
  tabBarTheme: const TabBarTheme(
    indicator: RoundUnderlineTabIndicator(
      borderSide: BorderSide(color: Colors.white, width: 5),
    ),
    indicatorSize: TabBarIndicatorSize.label,
    labelStyle: TextStyle(fontFamily: 'Roboto'),
    unselectedLabelStyle: TextStyle(fontFamily: 'Roboto'),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: _primaryColor,
  ),
);
