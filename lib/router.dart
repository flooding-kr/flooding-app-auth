import 'package:flooding_app_auth/feature/sign_in/presentation/sign_in_presentation.dart';
import 'package:flooding_app_auth/feature/splash/presentation/splash_presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AuthRouter {
  static final AuthRouter _authRouter = AuthRouter._init();

  factory AuthRouter() => _authRouter;

  AuthRouter._init();

  static const String splashPath = '/splash';
  static const String signInPath = '/signIn';

  static GoRouter get router => GoRouter(
        initialLocation: splashPath,
        routes: [
          _goRoute(splashPath, SplashPage()),
          _goRoute(signInPath, SignInPage()),
        ],
      );

  static GoRoute _goRoute(String path, Widget view) =>
      GoRoute(path: path, builder: (_, __) => view);
}
