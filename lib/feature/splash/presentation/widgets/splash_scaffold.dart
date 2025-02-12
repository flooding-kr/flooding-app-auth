part of '../splash_presentation.dart';

class _Scaffold extends StatelessWidget {
  final Widget logo;

  const _Scaffold({required this.logo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: logo,
      ),
    );
  }
}
