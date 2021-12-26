// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../data/models/note.dart' as _i6;
import '../ui/pages/create_note_page.dart' as _i2;
import '../ui/pages/notes_page.dart' as _i1;
import '../ui/pages/settings_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    NotesPageRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NotesPage());
    },
    CreateNotePageRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNotePageRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CreateNotePage(key: args.key, note: args.note));
    },
    SettingsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Settings());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(NotesPageRoute.name, path: '/'),
        _i4.RouteConfig(CreateNotePageRoute.name, path: '/create-note-page'),
        _i4.RouteConfig(SettingsRoute.name, path: '/Settings')
      ];
}

/// generated route for
/// [_i1.NotesPage]
class NotesPageRoute extends _i4.PageRouteInfo<void> {
  const NotesPageRoute() : super(NotesPageRoute.name, path: '/');

  static const String name = 'NotesPageRoute';
}

/// generated route for
/// [_i2.CreateNotePage]
class CreateNotePageRoute extends _i4.PageRouteInfo<CreateNotePageRouteArgs> {
  CreateNotePageRoute({_i5.Key? key, required _i6.Note? note})
      : super(CreateNotePageRoute.name,
            path: '/create-note-page',
            args: CreateNotePageRouteArgs(key: key, note: note));

  static const String name = 'CreateNotePageRoute';
}

class CreateNotePageRouteArgs {
  const CreateNotePageRouteArgs({this.key, required this.note});

  final _i5.Key? key;

  final _i6.Note? note;

  @override
  String toString() {
    return 'CreateNotePageRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i3.Settings]
class SettingsRoute extends _i4.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/Settings');

  static const String name = 'SettingsRoute';
}
