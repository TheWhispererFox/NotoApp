// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../data/models/note.dart' as _i5;
import '../ui/views/create_note.dart' as _i2;
import '../ui/views/notes.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    NotesViewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.NotesView());
    },
    CreateNoteViewRoute.name: (routeData) {
      final args = routeData.argsAs<CreateNoteViewRouteArgs>();
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i2.CreateNoteView(key: args.key, note: args.note));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(NotesViewRoute.name, path: '/'),
        _i3.RouteConfig(CreateNoteViewRoute.name, path: '/create-note-view')
      ];
}

/// generated route for
/// [_i1.NotesView]
class NotesViewRoute extends _i3.PageRouteInfo<void> {
  const NotesViewRoute() : super(NotesViewRoute.name, path: '/');

  static const String name = 'NotesViewRoute';
}

/// generated route for
/// [_i2.CreateNoteView]
class CreateNoteViewRoute extends _i3.PageRouteInfo<CreateNoteViewRouteArgs> {
  CreateNoteViewRoute({_i4.Key? key, required _i5.Note? note})
      : super(CreateNoteViewRoute.name,
            path: '/create-note-view',
            args: CreateNoteViewRouteArgs(key: key, note: note));

  static const String name = 'CreateNoteViewRoute';
}

class CreateNoteViewRouteArgs {
  const CreateNoteViewRouteArgs({this.key, required this.note});

  final _i4.Key? key;

  final _i5.Note? note;

  @override
  String toString() {
    return 'CreateNoteViewRouteArgs{key: $key, note: $note}';
  }
}
