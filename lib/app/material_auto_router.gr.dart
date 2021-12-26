// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../data/models/note.dart' as _i7;
import '../ui/pages/create_note_page.dart' as _i2;
import '../ui/pages/notes_page.dart' as _i1;
import '../ui/pages/register_page.dart' as _i4;
import '../ui/pages/settings_page.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    NotesPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NotesPage());
    },
    CreateNotePageRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNotePageRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CreateNotePage(key: args.key, note: args.note));
    },
    SettingsRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Settings());
    },
    RegisterPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.RegisterPage());
    }
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(NotesPageRoute.name, path: '/notes-page'),
        _i5.RouteConfig(CreateNotePageRoute.name, path: '/create-note-page'),
        _i5.RouteConfig(SettingsRoute.name, path: '/Settings'),
        _i5.RouteConfig(RegisterPageRoute.name, path: '/')
      ];
}

/// generated route for
/// [_i1.NotesPage]
class NotesPageRoute extends _i5.PageRouteInfo<void> {
  const NotesPageRoute() : super(NotesPageRoute.name, path: '/notes-page');

  static const String name = 'NotesPageRoute';
}

/// generated route for
/// [_i2.CreateNotePage]
class CreateNotePageRoute extends _i5.PageRouteInfo<CreateNotePageRouteArgs> {
  CreateNotePageRoute({_i6.Key? key, required _i7.Note? note})
      : super(CreateNotePageRoute.name,
            path: '/create-note-page',
            args: CreateNotePageRouteArgs(key: key, note: note));

  static const String name = 'CreateNotePageRoute';
}

class CreateNotePageRouteArgs {
  const CreateNotePageRouteArgs({this.key, required this.note});

  final _i6.Key? key;

  final _i7.Note? note;

  @override
  String toString() {
    return 'CreateNotePageRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i3.Settings]
class SettingsRoute extends _i5.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/Settings');

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i4.RegisterPage]
class RegisterPageRoute extends _i5.PageRouteInfo<void> {
  const RegisterPageRoute() : super(RegisterPageRoute.name, path: '/');

  static const String name = 'RegisterPageRoute';
}
