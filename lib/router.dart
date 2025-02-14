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
          _goRoute(signInPath, SignInPage(), checkPrevious: true),
        ],
      );

  static GoRoute _goRoute(
    String path,
    Widget view, {
    bool checkPrevious = false,
  }) =>
      GoRoute(
        path: path,
        pageBuilder: (context, state) {
          final bool isFromSplash = state.extra == splashPath;

          if (checkPrevious && isFromSplash) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: view,
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            );
          }

          // 기본 전환 방식
          return CupertinoPage(
            key: state.pageKey,
            child: view,
          );
        },
      );
}
