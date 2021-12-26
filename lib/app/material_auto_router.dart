import 'package:auto_route/auto_route.dart';
import 'package:noto_app/ui/pages/create_note_page.dart';
import 'package:noto_app/ui/pages/notes_page.dart';
import 'package:noto_app/ui/pages/register_page.dart';
import 'package:noto_app/ui/pages/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,View',
  routes: <AutoRoute>[
    AutoRoute(page: NotesPage),
    AutoRoute(page: CreateNotePage),
    AutoRoute(page: SettingsPage),
    AutoRoute(page: RegisterPage, initial: true),
  ],
)
class $AppRouter {}
