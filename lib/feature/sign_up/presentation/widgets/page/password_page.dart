part of '../../sign_up_presentation.dart';

class _PasswordPage extends StatelessWidget {
  final TextEditingController passwordController;
  final VoidCallback onBackClick;
  final VoidCallback onNextClick;

  const _PasswordPage({
    required this.onBackClick,
    required this.passwordController,
    required this.onNextClick,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordBloc, PasswordState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.fromLTRB(16, 36, 16, 79),
        child: Column(
          children: [
            SignUpCard(
              title: '비밀번호를 입력해주세요',
              content: FloodingTextField(
                textStyle: FloodingTypography.body3Regular.copyWith(letterSpacing: 0),
                textFieldState: FloodingTextFieldState.password,
                controller: context.read<PasswordBloc>().controller,
                hintText: '비밀번호를 입력해주세요',
                validator: context.read<PasswordBloc>().validatePassword,
              ),
              onBackClick: onBackClick,
            ),
            Spacer(),
            FloodingDefaultButton(
              onTap: state is EnablePasswordState ? onNextClick : () {},
              text: "다음",
              textStyle: FloodingTypography.body3SemiBold,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              color: state is EnablePasswordState
                  ? FloodingColor.main600
                  : FloodingColor.gray400,
            ),
          ],
        ),
      ),
    );
  }
}
