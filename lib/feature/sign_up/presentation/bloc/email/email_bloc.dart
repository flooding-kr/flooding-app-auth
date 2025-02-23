part of '../../sign_up_presentation.dart';

class EmailBloc extends Bloc<EmailEvent, EmailState> {
  final TextEditingController controller;

  EmailBloc(this.controller) : super(DisableEmailState()) {
    on<EmailEnterEvent>(_handleEmailEnterEvent);
    on<AuthenticationEmailEvent>(_handleAuthenticationEmailEvent);
    controller.addListener(_onTextChanged); // 입력 감지 리스너 추가
  }

  // 텍스트 변경 감지하여 이벤트 발생
  void _onTextChanged() {
    add(EmailEnterEvent());
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력하세요.';
    }
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    if (!emailRegex.hasMatch(value)) {
      return '유효한 이메일 형식이 아닙니다.';
    }
    return null; // 유효하면 null 반환
  }

  // EmailController에 입력이 있을 때 enable, 없을 경우 disable
  void _handleEmailEnterEvent(EmailEvent event, Emitter<EmailState> emit) {
    validateEmail(controller.text) == null && controller.text.isNotEmpty
        ? emit(CanAccessEmailState())
        : emit(DisableEmailState());
  }

  void _handleAuthenticationEmailEvent(
      EmailEvent event, Emitter<EmailState> emit) {
    /// email 인증 로직
    emit(EnableEmailState());
  }

  @override
  Future<void> close() {
    controller.removeListener(_onTextChanged); // 리스너 제거
    return super.close();
  }
}
