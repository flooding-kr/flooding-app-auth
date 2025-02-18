part of '../../sign_up_presentation.dart';

class _PasswordPage extends StatelessWidget {

  final TextEditingController nameController;
  final VoidCallback onBackClick;
  final VoidCallback onNextClick;

  const _PasswordPage({
    required this.onBackClick,
    required this.nameController,
    required this.onNextClick,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 36, 16, 79),
          child: Column(
            children: [
              SignUpCard(
                title: '비밀번호를 입력해주세요',
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
