part of '../../sign_up_presentation.dart';

class _SexPage extends StatelessWidget {
  final Sex? sexType;
  final VoidCallback onBackClick;
  final VoidCallback onNextClick;

  const _SexPage({
    required this.onBackClick,
    required this.sexType,
    required this.onNextClick,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SexBloc, SexState>(
      builder: (context, state) => Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 36, 16, 79),
          child: Column(
            children: [
              SignUpCard(
                title: '성별을 알려주세요',
                content: Column(
                  spacing: 16,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 15,
                      children: [
                        Expanded(
                          child: FloodingDefaultButton(
                            onTap: () => context
                                .read<SexBloc>()
                                .add(SexEnterMaleEvent()),
                            text: '남성',
                            textStyle: FloodingTypography.body3SemiBold,
                            textColor: context.read<SexBloc>().sex == Sex.male
                                ? FloodingColor.white
                                : FloodingColor.gray500,
                            color: context.read<SexBloc>().sex == Sex.male
                                ? FloodingColor.main400
                                : FloodingColor.white,
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 68.w,
                            ),
                          ),
                        ),
                        Expanded(
                          child: FloodingDefaultButton(
                            onTap: () => context
                                .read<SexBloc>()
                                .add(SexEnterFemaleEvent()),
                            text: '여성',
                            textStyle: FloodingTypography.body3SemiBold,
                            textColor: context.read<SexBloc>().sex == Sex.female
                                ? FloodingColor.white
                                : FloodingColor.gray500,
                            color: context.read<SexBloc>().sex == Sex.female
                                ? FloodingColor.main400
                                : FloodingColor.white,
                            padding: EdgeInsets.symmetric(
                              vertical: 12.h,
                              horizontal: 68.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '개인정보 처리방침',
                          style: FloodingTypography.caption1Regular.copyWith(
                            color: FloodingColor.gray600,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context
                              .read<SexBloc>()
                              .add(PersonalInformationEvent()),
                          child: state is EnableSexState ?  FloodingIcon.checkBox(
                              color: FloodingColor.main600) : FloodingIcon.checkBoxOutline(
                              color: FloodingColor.gray400)
                        )
                      ],
                    )
                  ],
                ),
                onBackClick: onBackClick,
              ),
              Spacer(),
              FloodingDefaultButton(
                onTap: state is EnableSexState ? onNextClick : () {},
                text: "다음",
                textStyle: FloodingTypography.body3SemiBold,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                color: state is EnableSexState
                    ? FloodingColor.main600
                    : FloodingColor.gray400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
