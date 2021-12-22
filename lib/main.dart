import 'package:flutter/material.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
      theme: ThemeData(
        fontFamily: 'MontserratAlternates',
        splashFactory: NoSplash.splashFactory,
        cardColor: const Color(0xFF262635),
      ),
      title: 'Noto App',
    );
  }
}
