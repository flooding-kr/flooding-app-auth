part of '../../sign_up_presentation.dart';

class _NamePage extends StatelessWidget {
  final VoidCallback onBackClick;
  final VoidCallback onNextClick;
  final TextEditingController nameController;

  const _NamePage({
    required this.onBackClick,
    required this.onNextClick,
    required this.nameController,
  });

  String? nameValidator(String? value) {
    if (value == null || value.trim().isEmpty) return '이름을 입력해주세요';
    if (value.startsWith(' ')) return '이름은 공백으로 시작할 수 없습니다';
    if (value.length < 2) return '이름은 두 글자 이상이어야 합니다';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NameBloc, NameState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.fromLTRB(16, 36, 16, 79),
        child: Column(
          children: [
            SignUpCard(
              title: '이름을 알려주세요',
              content: FloodingTextField(
                textStyle:
                    FloodingTypography.body3Regular.copyWith(letterSpacing: 0),
                textFieldState: FloodingTextFieldState.basic,
                controller: context.read<NameBloc>().controller,
                validator: nameValidator,
                hintText: '이름을 입력해주세요',
              ),
              onBackClick: onBackClick,
            ),
            Spacer(),
            FloodingDefaultButton(
              onTap: state is EnableNameState ? onNextClick : () {},
              text: "다음",
              textStyle: FloodingTypography.body3SemiBold,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              color: state is EnableNameState
                  ? FloodingColor.main600
                  : FloodingColor.gray400,
            ),
          ],
        ),
      ),
    );
  }
}
