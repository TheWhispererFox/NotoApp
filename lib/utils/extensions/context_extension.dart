import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_langs.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  CupertinoThemeData get cupertinoTheme => CupertinoTheme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;

  MediaQueryData get mq => MediaQuery.of(this);

  double get screenWidth => mq.size.width;
  double get screenHeight => mq.size.height;

  double get percentWidth => screenWidth / 100;
  double get percentHeight => screenHeight / 100;

  double get _safeAreaHorizontal => mq.padding.left + mq.padding.right;
  double get _safeAreaVertical => mq.padding.top + mq.padding.bottom;

  double get safePercentWidth => (screenWidth - _safeAreaHorizontal) / 100;
  double get safePercentHeight => (screenHeight - _safeAreaVertical) / 100;

  Orientation get orientation => mq.orientation;

  bool get isLandscape => orientation == Orientation.landscape;

  ScaffoldState get scaffold => Scaffold.of(this);
  OverlayState? get overlay => Overlay.of(this);
  Locale get locale => Localizations.localeOf(this);
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);
  NavigatorState get navigator => Navigator.of(this);
  FocusScopeNode get focusScope => FocusScope.of(this);
  AppLocalizations? get lang => AppLocalizations.of(this);
}
