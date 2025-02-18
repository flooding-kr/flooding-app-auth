part of '../../sign_up_presentation.dart';

class _EmailPage extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController authenticationCodeController;
  final VoidCallback onBackClick;
  final VoidCallback onNextClick;
  final VoidCallback onAuthenticationClick;

  const _EmailPage({
    required this.onBackClick,
    required this.authenticationCodeController,
    required this.emailController,
    required this.onNextClick,
    required this.onAuthenticationClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(16, 36, 16, 79),
      child: Column(
        children: [
          SignUpCard(
            title: '이메일을 알려주세요',
            content: Container(),
            onBackClick: onBackClick,
          ),
          SizedBox(height: double.infinity),
          FloodingDefaultButton(onTap: onNextClick, text: "다음"),
        ],
      ),
    ));
  }
}
