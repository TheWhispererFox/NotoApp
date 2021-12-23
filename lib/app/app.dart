import 'package:flutter/material.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/app/themes.dart' as themes;
import 'package:noto_app/domain/notes/notes_bloc.dart';
import 'package:noto_app/domain/themes/theme_bloc.dart';
import 'package:noto_app/utils/extensions/stream_extension.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static String appName = "Noto App";

  final AppRouter _appRouter = locator.get();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ThemeBloc>(
          create: (_) => ThemeBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
        Provider<NotesBloc>(
          create: (_) => NotesBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        ),
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
            );
          },
        );
      },
    );
  }
}
