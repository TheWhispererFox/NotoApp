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
import '../ui/views/create_note.dart' as _i2;
import '../ui/views/notes.dart' as _i1;
import '../ui/views/settings_page.dart' as _i3;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    NotesViewRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NotesView());
    },
    CreateNoteViewRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNoteViewRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CreateNoteView(key: args.key, note: args.note));
    },
    SettingsRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Settings());
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(NotesViewRoute.name, path: '/'),
        _i4.RouteConfig(CreateNoteViewRoute.name, path: '/create-note-view'),
        _i4.RouteConfig(SettingsRoute.name, path: '/Settings')
      ];
}

/// generated route for
/// [_i1.NotesView]
class NotesViewRoute extends _i4.PageRouteInfo<void> {
  const NotesViewRoute() : super(NotesViewRoute.name, path: '/');

  static const String name = 'NotesViewRoute';
}

/// generated route for
/// [_i2.CreateNoteView]
class CreateNoteViewRoute extends _i4.PageRouteInfo<CreateNoteViewRouteArgs> {
  CreateNoteViewRoute({_i5.Key? key, required _i6.Note? note})
      : super(CreateNoteViewRoute.name,
            path: '/create-note-view',
            args: CreateNoteViewRouteArgs(key: key, note: note));

  static const String name = 'CreateNoteViewRoute';
}

class CreateNoteViewRouteArgs {
  const CreateNoteViewRouteArgs({this.key, required this.note});

  final _i5.Key? key;

  final _i6.Note? note;

  @override
  String toString() {
    return 'CreateNoteViewRouteArgs{key: $key, note: $note}';
  }
}

/// generated route for
/// [_i3.Settings]
class SettingsRoute extends _i4.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/Settings');

  static const String name = 'SettingsRoute';
}
