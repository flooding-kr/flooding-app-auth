part of '../sign_in_presentation.dart';

class _FindPasswordButton extends StatelessWidget {
  const _FindPasswordButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        '비밀번호 찾기',
        style: FloodingTypography.caption2SemiBold.copyWith(
          color: FloodingColor.main400,
        ),
      ),
    );
  }
}
