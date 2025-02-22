part of '../sign_in_presentation.dart';

class _EmailTextField extends StatelessWidget {
  const _EmailTextField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return FloodingTextField(
      textFieldState: FloodingTextFieldState.email,
      controller: controller,
      hintText: '이메일을 입력해주세요',
    );
  }
}
