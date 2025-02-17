part of '../sign_in_presentation.dart';

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.onTap,
    required this.color,
  });

  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return FloodingDefaultButton(
      onTap: onTap,
      text: '확인',
      color: color,
    );
  }
}
