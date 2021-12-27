// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../data/models/note.dart' as _i9;
import '../ui/pages/auth_page.dart' as _i1;
import '../ui/pages/create_note_page.dart' as _i4;
import '../ui/pages/notes_page.dart' as _i3;
import '../ui/pages/register_page.dart' as _i2;
import '../ui/pages/settings_page.dart' as _i5;
import 'auth_guard.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter(
      {_i7.GlobalKey<_i7.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i8.AuthGuard authGuard;

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    AuthPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.AuthPage());
    },
    RegisterPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.RegisterPage());
    },
    NotesPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.NotesPage());
    },
    CreateNotePageRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNotePageRouteArgs>();
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i4.CreateNotePage(key: args.key, note: args.note));
    },
    SettingsPageRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i5.SettingsPage());
    }
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(AuthPageRoute.name, path: '/auth-page'),
        _i6.RouteConfig(RegisterPageRoute.name, path: '/register-page'),
        _i6.RouteConfig(NotesPageRoute.name, path: '/', guards: [authGuard]),
        _i6.RouteConfig(CreateNotePageRoute.name,
            path: '/create-note-page', guards: [authGuard]),
        _i6.RouteConfig(SettingsPageRoute.name,
            path: '/settings-page', guards: [authGuard])
      ];
}

/// generated route for
/// [_i1.AuthPage]
class AuthPageRoute extends _i6.PageRouteInfo<void> {
  const AuthPageRoute() : super(AuthPageRoute.name, path: '/auth-page');

  static const String name = 'AuthPageRoute';
}

/// generated route for
/// [_i2.RegisterPage]
class RegisterPageRoute extends _i6.PageRouteInfo<void> {
  const RegisterPageRoute()
      : super(RegisterPageRoute.name, path: '/register-page');

  static const String name = 'RegisterPageRoute';
}

/// generated route for
/// [_i3.NotesPage]
class NotesPageRoute extends _i6.PageRouteInfo<void> {
  const NotesPageRoute() : super(NotesPageRoute.name, path: '/');

  static const String name = 'NotesPageRoute';
}

/// generated route for
/// [_i4.CreateNotePage]
class CreateNotePageRoute extends _i6.PageRouteInfo<CreateNotePageRouteArgs> {
  CreateNotePageRoute({_i7.Key? key, required _i9.Note? note})
      : super(CreateNotePageRoute.name,
            path: '/create-note-page',
            args: CreateNotePageRouteArgs(key: key, note: note));

  static const String name = 'CreateNotePageRoute';
}

class CreateNotePageRouteArgs {
  const CreateNotePageRouteArgs({this.key, required this.note});

  final _i7.Key? key;

  final _i9.Note? note;

  @override
  String toString() {
    return 'CreateNotePageRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i5.SettingsPage]
class SettingsPageRoute extends _i6.PageRouteInfo<void> {
  const SettingsPageRoute()
      : super(SettingsPageRoute.name, path: '/settings-page');

  static const String name = 'SettingsPageRoute';
}
