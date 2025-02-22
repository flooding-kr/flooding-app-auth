part of '../../sign_up_presentation.dart';

enum Sex {
  male,
  female,
}

class _SexPage extends StatelessWidget {
  final TextEditingController sexController;
  final Sex sexType;
  final VoidCallback onBackClick;
  final VoidCallback onNextClick;
  final void Function(Sex) onSexChange;

  const _SexPage({
    required this.onBackClick,
    required this.sexType,
    required this.sexController,
    required this.onNextClick,
    required this.onSexChange,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.fromLTRB(16, 36, 16, 79),
      child: Column(
        children: [
          SignUpCard(
            title: '성별을 알려주세요',
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
