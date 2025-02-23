part of '../sign_in_presentation.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  SignInBloc({required this.emailController, required this.passwordController})
      : super(SignInInitState()) {
    on<EmailEnterEvent>(_handleEnterEvent);
    on<PasswordEnterEvent>(_handleEnterEvent);
    on<SignInLoadingEvent>(_handleSignInLoadingEvent);
    on<SignInSuccessEvent>(_handleSignInSuccessEvent);

    emailController.addListener(_onEmailChanged);
    passwordController.addListener(_onPasswordChanged);
  }

  void _onEmailChanged() {
    add(EmailEnterEvent());
  }

  void _onPasswordChanged() {
    add(PasswordEnterEvent());
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return '이메일을 입력하세요.';
    }
    final RegExp emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return '유효한 이메일 형식이 아닙니다.';
    }
    return null; // 유효하면 null 반환
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return '비밀번호를 입력하세요.';
    }
    if (value.length < 8) {
      return '비밀번호는 최소 8자 이상이어야 합니다.';
    }
    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d\W]+$')
        .hasMatch(value)) {
      return '영문과 숫자를 포함해야 합니다.';
    }
    return null; // 유효하면 null 반환
  }

  void _handleEnterEvent(SignInEvent event, Emitter<SignInState> emit) {
    final isEmailValid = validateEmail(emailController.text) == null;
    final isPasswordValid = validatePassword(passwordController.text) == null;
    if (isEmailValid && isPasswordValid) {
      emit(EnableSubmitSignInState());
    } else {
      emit(DisableSubmitSignInState());
    }
  }

  void _handleSignInLoadingEvent(
      SignInEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());

    if (await _login()) {
      emit(SignInSuccessState());
    } else {
      emit(SignInErrorState());
    }
  }

  void _handleSignInSuccessEvent(
      SignInEvent event, Emitter<SignInState> emit) async {
    emit(SignInSuccessState());
  }

  Future<bool> _login() async {
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  @override
  Future<void> close() {
    emailController.removeListener(_onEmailChanged);
    passwordController.removeListener(_onPasswordChanged);
    return super.close();
  }
}
