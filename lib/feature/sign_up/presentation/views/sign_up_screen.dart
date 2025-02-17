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
          _NameScaffold(),
        ],
      ),
    );
  }

  _navigatorPage(int index) {
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }
}
