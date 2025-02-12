import 'package:bloc/bloc.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitState()) {
    on<SplashInitEvent>((event, emit) {});
    on<SplashDisposeEvent>((event, emit) {});
  }
}
