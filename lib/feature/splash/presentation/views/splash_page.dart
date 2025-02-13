part of '../splash_presentation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SplashBloc>(
      create: (BuildContext context) =>
          SplashBloc()..add(SplashToSignInEvent()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (BuildContext context, SplashState state) {
          if (state is SplashDisposeState) {
            context.go(AuthRouter.signInPath);
          }
        },
        child: _Scaffold(
          logo: _Logo(),
        ),
      ),
    );
  }
}
