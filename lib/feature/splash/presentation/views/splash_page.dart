part of '../splash_presentation.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SplashBloc(),
      child: _Scaffold(
        logo: _Logo(),
      ),
    );
  }
}
