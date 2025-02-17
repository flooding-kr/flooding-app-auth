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
            context.go(AuthRouter.signInPath, extra: AuthRouter.splashPath);
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
