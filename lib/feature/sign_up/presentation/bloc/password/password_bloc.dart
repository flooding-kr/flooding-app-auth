part of '../../sign_up_presentation.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordState> {
  final TextEditingController controller;

  PasswordBloc(this.controller) : super(DisablePasswordState()) {
    on<PasswordEnterEvent>(_handlePasswordEnterEvent);
    controller.addListener(_onTextChanged); // 입력 감지 리스너 추가
  }

  // 텍스트 변경 감지하여 이벤트 발생
  void _onTextChanged() {
    add(PasswordEnterEvent());
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력하세요.';
    }
    if (value.length < 8) {
      return '비밀번호는 최소 8자 이상이어야 합니다.';
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*?&~]+$')
        .hasMatch(value)) {
      return '영문과 숫자를 포함해야 합니다.';
    }
    return null; // 유효하면 null 반환
  }

  // passwordController에 입력이 있을 때 enable, 없을 경우 disable
  void _handlePasswordEnterEvent(
      PasswordEvent event, Emitter<PasswordState> emit) {
    validatePassword(controller.text) == null && controller.text.isNotEmpty
        ? emit(EnablePasswordState())
        : emit(DisablePasswordState());
  }

  @override
  Future<void> close() {
    controller.removeListener(_onTextChanged); // 리스너 제거
    return super.close();
  }
}
