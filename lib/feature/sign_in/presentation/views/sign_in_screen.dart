part of '../sign_in_presentation.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SignInBloc(
        emailController: emailController,
        passwordController: passwordController,
      ),
      child: BlocBuilder<SignInBloc, SignInState>(
          builder: (context, state) => Stack(
                children: [
                  GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Scaffold(
                      body: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _Logo(),
                            SizedBox(height: 24),
                            _EmailTextField(
                                controller:
                                    context.read<SignInBloc>().emailController),
                            SizedBox(height: 16),
                            _PasswordTextField(
                              controller:
                                  context.read<SignInBloc>().passwordController,
                              validator:
                                  context.read<SignInBloc>().validatePassword,
                            ),
                            SizedBox(height: 80),
                            _LoginButton(
                              onTap: state is EnableSubmitSignInState
                                  ? () {
                                      context
                                          .read<SignInBloc>()
                                          .add(SignInLoadingEvent());
                                    }
                                  : () {
                                      print('응 안돼');
                                    },
                              color: state is EnableSubmitSignInState
                                  ? FloodingColor.main600
                                  : FloodingColor.gray500,
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _SignUpTextButton(
                                    onTap: () => Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (builder) =>
                                                SignUpScreen(),
                                          ),
                                        )),
                                _FindPasswordButton(onTap: () {}),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  state is SignInLoadingState
                      ? Scaffold(
                          backgroundColor: Colors.transparent.withOpacity(0.2),
                          body: Center(
                              child: CircularProgressIndicator(
                            color: FloodingColor.main600,
                          )))
                      : SizedBox(),
                ],
              )),
    );
  }
}
