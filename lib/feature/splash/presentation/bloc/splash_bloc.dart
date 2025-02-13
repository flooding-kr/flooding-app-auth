import 'package:bloc/bloc.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitState()) {
    on<SplashToSignInEvent>(_handlerSplashToSignEvent);
  }

  void _handlerSplashToSignEvent(SplashEvent event, Emitter<SplashState> emit) async{
    emit(SplashLoadingState());
    // shared preference에서 캐싱한 로그인 정보 (id, pw or token)를 불러와 로그인을 합니다
    print('start');
    await Future.delayed(Duration(seconds: 3));
    print('stop');
    // shared preference에서 캐싱한 로그인 정보 (id, pw or token)를 불러와 로그인을 합니다
    emit(SplashDisposeState());
  }
}
