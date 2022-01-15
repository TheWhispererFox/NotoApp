import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_langs.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:noto_app/app/auth_guard.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/app/themes.dart' as themes;
import 'package:noto_app/domain/notes/notes_bloc.dart';
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/domain/user/user_bloc.dart';
import 'package:noto_app/services/preferences_service.dart';
import 'package:noto_app/utils/extensions/stream_extension.dart';

final themeBlocProvider = Provider(
  (ref) {
    final PreferencesService _preferencesService = locator.get();
    return ThemeBloc(
      initialThemeMode:
          _preferencesService.darkMode ? ThemeMode.dark : ThemeMode.light,
      onThemeModeChanged: (theme) {
        _preferencesService.darkMode = theme == ThemeMode.dark;
      },
    );
  },
);

final notesBlocProvider = Provider.autoDispose<NotesBloc>(
  (ref) => NotesBloc(),
);

final userBlocProvider = Provider.autoDispose(
  (ref) => UserBloc(),
);

class App extends ConsumerWidget {
  App({Key? key}) : super(key: key);

  static String appName = "Noto App";

  late final _appRouter = AppRouter(navigatorKey: _key, authGuard: AuthGuard());
  final _key = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeBloc = ref.watch(themeBlocProvider);

    return themeBloc.stateStream.builderNoLoading(
      onData: (_, state) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: _appRouter.defaultRouteParser(),
          routerDelegate: _appRouter.delegate(),
          darkTheme: themes.dark,
          theme: themes.light,
          themeMode: state.themeMode,
          title: appName,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale('ru', 'RU'),
          ],
        );
      },
    );
  }
}
