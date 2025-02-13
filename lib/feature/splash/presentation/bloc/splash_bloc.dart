import 'package:bloc/bloc.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitState()) {
    on<SplashInitEvent>(_handlerInitEvent);
    on<SplashDisposeEvent>(_handlerDisposeEvent);
  }

  void _handlerInitEvent(SplashInitEvent event, Emitter<SplashState> emit) {
    emit(SplashInitState());
  }

  void _handlerDisposeEvent(
      SplashDisposeEvent event, Emitter<SplashState> emit) {
    emit(SplashInitState());
  }
}
