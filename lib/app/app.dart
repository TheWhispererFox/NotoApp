import 'package:flutter/material.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/app/themes.dart' as themes;

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  static String appName = "Noto App";

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: themes.light,
      title: appName,
    );
  }
}
