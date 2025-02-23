part of '../sign_in_presentation.dart';

class _PasswordTextField extends StatelessWidget {
  const _PasswordTextField({required this.controller, required this.validator});

  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return FloodingTextField(
      textFieldState: FloodingTextFieldState.password,
      controller: controller,
      validator: validator,
      hintText: '비밀번호를 입력해주세요',
    );
  }
}
