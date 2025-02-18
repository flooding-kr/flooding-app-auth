part of '../../sign_up_presentation.dart';

class _NamePage extends StatelessWidget {

  final TextEditingController nameController;
  final VoidCallback onBackClick;
  final VoidCallback onNextClick;

  const _NamePage({
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
            title: '이름을 알려주세요',
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
