part of '../sign_up_presentation.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  static PageController pageController = PageController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final Map<String, String?> classController = {
    'grade': null,
    'class': null,
    'number': null
  };
  final TextEditingController passwordController = TextEditingController();
  Sex? sex;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => NameBloc(nameController)..add(NameEnterEvent()),
        ),
        BlocProvider(
          create: (_) => EmailBloc(emailController)..add(EmailEnterEvent()),
        ),
        BlocProvider(
          create: (_) => ClassBloc(classController),
        ),
        BlocProvider(
          create: (_) =>
              PasswordBloc(passwordController)..add(PasswordEnterEvent()),
        ),
        BlocProvider(
          create: (_) => SexBloc(sex),
        )
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: PageView(
              controller: pageController,
              physics: NeverScrollableScrollPhysics(),
              children: [
                _NamePage(
                  onBackClick: () => _navigatorPage(context, -1),
                  onNextClick: () => _navigatorPage(context, 1),
                  nameController: nameController,
                ),
                _EmailPage(
                  authenticationCodeController: TextEditingController(),
                  emailController: emailController,
                  onBackClick: () => _navigatorPage(context, 0),
                  onNextClick: () => _navigatorPage(context, 2),
                  onAuthenticationClick: () {},
                ),
                _ClassPage(
                  classController: classController,
                  onBackClick: () => _navigatorPage(context, 1),
                  onNextClick: () => _navigatorPage(context, 3),
                ),
                _PasswordPage(
                  passwordController: passwordController,
                  onBackClick: () => _navigatorPage(context, 2),
                  onNextClick: () => _navigatorPage(context, 4),
                ),
                _SexPage(
                  sexType: sex,
                  onBackClick: () => _navigatorPage(context, 3),
                  onNextClick: () => _navigatorPage(context, 5),
                ),
                _CertificationNumberPage()
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigatorPage(BuildContext context, int index) {
    FocusScope.of(context).unfocus();
    if (index == -1) {
      Navigator.pop(context);
    } else {
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    }
  }
}
