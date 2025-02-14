part of '../sign_in_presentation.dart';

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return FloodingTextField(
      textFieldState: FloodingTextFieldState.password,
      controller: controller,
      hintText: '비밀번호를 입력해주세요',
    );
  }
}
