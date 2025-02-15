part of '../sign_in_presentation.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _Scaffold(
      logo: _Logo(),
      emailTextfield: _EmailTextField(controller: emailController),
      passwordTextfield: _PasswordTextField(controller: passwordController),
      loginButton: _LoginButton(
        onTap: () {},
        color: FloodingColor.gray500,
      ),
      signUpTextButton: _SignUpTextButton(
        onTap: () => context.go('/signUp'),
      ),
      findPasswordButton: _FindPasswordButton(
        onTap: () => context.go('/findPassword'),
      ),
    );
  }
}
