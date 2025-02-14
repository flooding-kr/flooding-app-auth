part of '../sign_in_presentation.dart';

class _SignUpTextButton extends StatelessWidget {
  const _SignUpTextButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '아직 플러딩을 로그인 안 하셨나요?  |  ',
          style: FloodingTypography.caption2Medium
              .copyWith(color: FloodingColor.gray400),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            '회원가입',
            style: FloodingTypography.caption2SemiBold.copyWith(
              color: FloodingColor.gray700,
            ),
          ),
        )
      ],
    );
  }
}
