part of '../splash_presentation.dart';

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return Hero(tag: 'logo', child: FloodingIcon.logo());
  }
}
