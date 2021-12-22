// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../ui/views/create_note.dart' as _i2;
import '../ui/views/notes.dart' as _i1;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    NotesViewRoute.name: (routeData) {
      final args = routeData.argsAs<NotesViewRouteArgs>(
          orElse: () => const NotesViewRouteArgs());
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.NotesView(key: args.key));
    },
    CreateNoteViewRoute.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.CreateNoteView());
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
class NotesViewRoute extends _i3.PageRouteInfo<NotesViewRouteArgs> {
  NotesViewRoute({_i4.Key? key})
      : super(NotesViewRoute.name,
            path: '/', args: NotesViewRouteArgs(key: key));

  static const String name = 'NotesViewRoute';
}

class NotesViewRouteArgs {
  const NotesViewRouteArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'NotesViewRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.CreateNoteView]
class CreateNoteViewRoute extends _i3.PageRouteInfo<void> {
  const CreateNoteViewRoute()
      : super(CreateNoteViewRoute.name, path: '/create-note-view');

  static const String name = 'CreateNoteViewRoute';
}
