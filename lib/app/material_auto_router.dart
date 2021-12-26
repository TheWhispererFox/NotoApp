import 'package:auto_route/auto_route.dart';
import 'package:noto_app/ui/views/create_note_page.dart';
import 'package:noto_app/ui/views/notes_page.dart';
import 'package:noto_app/ui/views/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,View',
  routes: <AutoRoute>[
    AutoRoute(page: NotesPage, initial: true),
    AutoRoute(page: CreateNotePage),
    AutoRoute(page: Settings),
  ],
)
class $AppRouter {}
