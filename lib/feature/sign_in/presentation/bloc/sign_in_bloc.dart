part of '../sign_in_presentation.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitState()) {
    on<SignInLoadingEvent>(_handlerSignInLoadingEvent);
    on<SignInSuccessEvent>(_handlerSignInSuccessEvent);
    on<SignInErrorEvent>(_handlerSignInErrorEvent);
  }

  void _handlerSignInLoadingEvent(
      SignInEvent event, Emitter<SignInState> emit) async {
    emit(SignInLoadingState());
    if (await _login()) {
      // 로그인이 됐다면
      emit(SignInSuccessState());
    } else {
      // 안됐다면
      emit(SignInErrorState());
    }
  }

  Future<bool> _login() async {
    //로그인 로직
    await Future.delayed(Duration(seconds: 3));
    return true;
  }

  void _handlerSignInSuccessEvent(
      SignInEvent event, Emitter<SignInState> emit) {
    // home페이지로 이동
  }

  void _handlerSignInErrorEvent(SignInEvent event, Emitter<SignInState> emit) {
    // text에 error메시지
  }
}
