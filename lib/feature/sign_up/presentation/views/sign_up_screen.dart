part of '../sign_up_presentation.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _NamePage(
            onBackClick: context.pop,
            onNextClick: _navigatorPage(1),
            nameController: TextEditingController(),
          ),
          _EmailPage(
            authenticationCodeController: TextEditingController(),
            emailController: TextEditingController(),
            onBackClick: _navigatorPage(0),
            onNextClick: _navigatorPage(2),
            onAuthenticationClick: () {},
          ),
          _PasswordPage(
            nameController: TextEditingController(),
            onBackClick: _navigatorPage(1),
            onNextClick: _navigatorPage(3),
          )
        ],
      ),
    );
  }

  _navigatorPage(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
