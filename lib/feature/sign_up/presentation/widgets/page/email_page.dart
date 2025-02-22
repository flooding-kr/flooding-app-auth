part of '../../sign_up_presentation.dart';

class _EmailPage extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController authenticationCodeController;
  final VoidCallback onBackClick;
  final VoidCallback onNextClick;
  final VoidCallback onAuthenticationClick;

  _EmailPage({
    required this.onBackClick,
    required this.authenticationCodeController,
    required this.emailController,
    required this.onNextClick,
    required this.onAuthenticationClick,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailBloc, EmailState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.fromLTRB(16, 36, 16, 79),
        child: Column(
          children: [
            SignUpCard(
              title: '이메일을 알려주세요',
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  Expanded(
                    child: FloodingTextField(
                        textFieldState: FloodingTextFieldState.email,
                        controller: context.read<EmailBloc>().controller,
                        hintText: '이메일을 입력해주세요'),
                  ),
                  FloodingDefaultButton(
                    onTap: state is CanAccessEmailState
                        ? () => context
                            .read<EmailBloc>()
                            .add(AuthenticationEmailEvent())
                        : () {},
                    text: '인증번호',
                    textStyle: FloodingTypography.body3SemiBold,
                    color: state is CanAccessEmailState
                        ? FloodingColor.main600
                        : FloodingColor.gray400,
                    width: 106.w,
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 14),
                  )
                ],
              ),
              onBackClick: onBackClick,
            ),
            Spacer(),
            FloodingDefaultButton(
              onTap: state is EnableEmailState ? onNextClick : () {},
              text: "다음",
              textStyle: FloodingTypography.body3SemiBold,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              color: state is EnableEmailState
                  ? FloodingColor.main600
                  : FloodingColor.gray400,
            ),
          ],
        ),
      ),
    );
  }
}
