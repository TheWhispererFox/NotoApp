import 'package:flutter/material.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/app/themes.dart' as themes;
import 'package:noto_app/domain/notes/notes_bloc.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static String appName = "Noto App";

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NotesBloc>(
          create: (_) => NotesBloc(),
          dispose: (_, bloc) => bloc.dispose(),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        theme: themes.light,
        title: appName,
      ),
    );
  }
}
