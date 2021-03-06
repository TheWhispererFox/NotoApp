import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_gen/gen_l10n/app_langs.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:noto_app/app/auth_guard.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/app/themes.dart' as themes;
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/domain/user/user_bloc.dart';
import 'package:noto_app/services/preferences_service.dart';
import 'package:noto_app/utils/extensions/stream_extension.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static String appName = "Noto App";

  late final _appRouter = AppRouter(navigatorKey: _key, authGuard: AuthGuard());
  final _key = GlobalKey<NavigatorState>();
  late final PreferencesService _preferencesService = locator.get();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeBloc>(
          create: (_) => ThemeBloc(
            initialThemeMode:
                _preferencesService.darkMode ? ThemeMode.dark : ThemeMode.light,
            onThemeModeChanged: (theme) {
              _preferencesService.darkMode = theme == ThemeMode.dark;
            },
          ),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<UserBloc>(
          create: (_) => UserBloc(),
          dispose: (_, bloc) => bloc.dispose(),
          lazy: false,
        )
      ],
      builder: (context, _) {
        return context.read<ThemeBloc>().stateStream.builderNoLoading(
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
      },
    );
  }
}
