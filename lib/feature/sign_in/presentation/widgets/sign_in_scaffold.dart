part of '../sign_in_presentation.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.logo,
    required this.emailTextfield,
    required this.passwordTextfield,
    required this.loginButton,
    required this.signUpTextButton,
    required this.findPasswordButton,
  });

  final Widget logo;
  final Widget emailTextfield;
  final Widget passwordTextfield;
  final Widget loginButton;
  final Widget signUpTextButton;
  final Widget findPasswordButton;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            logo,
            SizedBox(
              height: 24,
            ),
            emailTextfield,
            SizedBox(
              height: 16,
            ),
            passwordTextfield,
            SizedBox(
              height: 80,
            ),
            loginButton,
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [signUpTextButton, findPasswordButton],
            )
          ],
        ),
      ),
    );
  }
}
