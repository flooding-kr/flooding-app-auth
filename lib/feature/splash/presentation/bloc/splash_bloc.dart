part of '../splash_presentation.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitState()) {
    on<SplashToSignInEvent>(_handlerSplashToSignEvent);
  }

  void _handlerSplashToSignEvent(SplashEvent event, Emitter<SplashState> emit) async{
    emit(SplashLoadingState());
    // shared preference에서 캐싱한 로그인 정보 (id, pw or token)를 불러와 로그인을 합니다
    await Future.delayed(Duration(seconds: 3));
    // shared preference에서 캐싱한 로그인 정보 (id, pw or token)를 불러와 로그인을 합니다
    emit(SplashDisposeState());
  }
}
