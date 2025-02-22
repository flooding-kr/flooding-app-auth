part of '../sign_in_presentation.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _Logo(),
            SizedBox(height: 24),
            _EmailTextField(controller: emailController),
            SizedBox(height: 16),
            _PasswordTextField(controller: passwordController),
            SizedBox(height: 80),
            _LoginButton(
              onTap: emailController.text.isEmpty ||
                      passwordController.text.isEmpty
                  ? () {}
                  : () {},
              color: FloodingColor.gray500,
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _SignUpTextButton(
                    onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => SignUpScreen(),
                          ),
                        )),
                _FindPasswordButton(onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
