part of '../../sign_up_presentation.dart';

class _CertificationNumberPage extends StatelessWidget {
  const _CertificationNumberPage();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EmailBloc, EmailState>(
      builder: (context, state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 60,
        children: [
          SvgPicture.asset(
            'packages/flooding_app_auth/assets/images/certification_number_logo.svg',
            height: 82.h,
            width: 294.w,
          ),
          Column(
            spacing: 16,
            children: [
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.read<EmailBloc>().controller.text,
                    style: FloodingTypography.body2SemiBold,
                  ),
                  Text(
                    '발송되었습니다.',
                    style: FloodingTypography.body2Regular.copyWith(
                      color: FloodingColor.main600,
                    ),
                  )
                ],
              ),
              Row(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '메일함을 확인해주세요',
                    style: FloodingTypography.body3Regular.copyWith(
                      color: FloodingColor.gray700,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => SignInScreen()),
                        (predicate) => false),
                    child: Text(
                      '로그인 하러가기',
                      style: FloodingTypography.caption1Regular.copyWith(
                        color: FloodingColor.main600,
                        decoration: TextDecoration.underline,
                        decorationColor: FloodingColor.main600,
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
