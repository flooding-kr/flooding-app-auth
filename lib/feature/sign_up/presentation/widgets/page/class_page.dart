part of '../../sign_up_presentation.dart';

class _ClassPage extends StatelessWidget {
  final Map<String, String?> classController;
  final VoidCallback onBackClick;
  final VoidCallback onNextClick;

  const _ClassPage({
    required this.onBackClick,
    required this.classController,
    required this.onNextClick,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassBloc, ClassState>(
      builder: (context, state) => Padding(
        padding: EdgeInsets.fromLTRB(16, 36, 16, 79),
        child: Column(
          children: [
            SignUpCard(
              title: '기수, 반, 번호를 알려주세요',
              content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloodingDropdownButton(
                      onTap: (value) {
                        context.read<ClassBloc>().classInfo['grade']  = value;                        context.read<ClassBloc>().add(ClassEnterEvent());
                      },
                      showList: ['7기', '8기', '9기', '10기'],
                      defaultValue: '기수'),
                  FloodingDropdownButton(
                      onTap: (value) {
                        context.read<ClassBloc>().classInfo['class']  = value;
                        context.read<ClassBloc>().add(ClassEnterEvent());
                      },
                      showList: ['1반', '2반', '3반', '4반'],
                      defaultValue: '반'),
                  FloodingDropdownButton(
                      onTap: (value) {
                        context.read<ClassBloc>().classInfo['number']  = value;                        context.read<ClassBloc>().add(ClassEnterEvent());
                      },
                      showList: [
                        '1번',
                        '2번',
                        '3번',
                        '4번',
                        '5번',
                        '6번',
                        '7번',
                        '8번',
                        '9번',
                        '10번',
                        '11번',
                        '12번',
                        '13번',
                        '14번',
                        '15번',
                        '16번',
                        '17번',
                        '18번',
                      ],
                      defaultValue: '번호'),
                ],
              ),
              onBackClick: onBackClick,
            ),
            Spacer(),
            FloodingDefaultButton(
              onTap: state is EnableClassState ? onNextClick : () {},
              text: "다음",
              textStyle: FloodingTypography.body3SemiBold,
              padding: EdgeInsets.symmetric(vertical: 12.h),
              color: state is EnableClassState
                  ? FloodingColor.main600
                  : FloodingColor.gray400,
            ),
          ],
        ),
      ),
    );
  }
}
