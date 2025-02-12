import 'package:flooding_app_auth/feature/splash/presentation/splash_presentation.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splashPath = '/splash';

  static GoRouter router() => GoRouter(
        initialLocation: splashPath,
        routes: [
          _goRoute(splashPath, SplashPage()),
        ],
      );

  static GoRoute _goRoute(String path, Widget view) =>
      GoRoute(path: path, builder: (_, __) => view);
}
