import 'package:auto_route/auto_route.dart';
import 'package:noto_app/ui/views/create_note.dart';
import 'package:noto_app/ui/views/notes.dart';
import 'package:noto_app/ui/views/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,View',
  routes: <AutoRoute>[
    AutoRoute(page: NotesView, initial: true),
    AutoRoute(page: CreateNoteView),
    AutoRoute(page: Settings),
  ],
)
class $AppRouter {}
