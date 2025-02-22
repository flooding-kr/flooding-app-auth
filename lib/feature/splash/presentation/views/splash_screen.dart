part of '../splash_presentation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (BuildContext context) =>
          SplashBloc()..add(SplashToSignInEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (BuildContext context, SplashState state) {
          if (state is SplashDisposeState) {
            Navigator.pushAndRemoveUntil(
                context,
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => SignInScreen(),
                  transitionsBuilder: (_, a, __, c) => FadeTransition(
                    opacity: a,
                    child: c,
                  ),
                ),
                (predicate) => false);
          }
        },
        child: Scaffold(
          body: Center(
            child: _Logo(),
          ),
        ),
      ),
    );
  }
}
