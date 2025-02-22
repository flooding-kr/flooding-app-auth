part of '../../sign_up_presentation.dart';

class NameBloc extends Bloc<NameEvent, NameState> {
  final TextEditingController controller;

  NameBloc(this.controller) : super(DisableNameState()) {
    on<NameEnterEvent>(_handleNameEnterEvent);
    controller.addListener(_onTextChanged); // 입력 감지 리스너 추가
  }

  // 텍스트 변경 감지하여 이벤트 발생
  void _onTextChanged() {
    add(NameEnterEvent());
  }

  // nameController에 입력이 있을 때 enable, 없을 경우 disable
  void _handleNameEnterEvent(NameEvent event, Emitter<NameState> emit) {
    controller.text.isNotEmpty
        ? emit(EnableNameState())
        : emit(DisableNameState());
  }

  @override
  Future<void> close() {
    controller.removeListener(_onTextChanged); // 리스너 제거
    return super.close();
  }
}
