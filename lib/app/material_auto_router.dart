import 'package:auto_route/auto_route.dart';
import 'package:noto_app/app/auth_guard.dart';
import 'package:noto_app/ui/pages/auth_page.dart';
import 'package:noto_app/ui/pages/create_note_page.dart';
import 'package:noto_app/ui/pages/notes_page.dart';
import 'package:noto_app/ui/pages/register_page.dart';
import 'package:noto_app/ui/pages/settings_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,View',
  routes: <AutoRoute>[
    AutoRoute(page: AuthPage),
    AutoRoute(page: RegisterPage),
    AutoRoute(page: NotesPage, initial: true, guards: [AuthGuard]),
    AutoRoute(page: CreateNotePage, guards: [AuthGuard]),
    AutoRoute(page: SettingsPage, guards: [AuthGuard]),
  ],
)
class $AppRouter {}
