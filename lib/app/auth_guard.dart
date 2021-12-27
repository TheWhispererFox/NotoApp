import 'package:auto_route/auto_route.dart';
import 'package:noto_app/app/locator.dart';
import 'package:noto_app/app/material_auto_router.gr.dart';
import 'package:noto_app/services/auth_service.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthService _auth = locator.get();

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_auth.isUserAuthentificated()) {
      resolver.next();
    } else {
      if (router.current.route.name != AuthPageRoute.name) {
        router.push(const AuthPageRoute());
      }
    }
  }
}
