part of '../../sign_up_presentation.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final Map<String, String?> classInfo;

  ClassBloc(this.classInfo) : super(DisableClassState()) {
    on(_handleClassEnterEvent);
  }

  void _handleClassEnterEvent(ClassEvent event, Emitter<ClassState> emit) {
    if (classInfo['grade'] == '' ||
        classInfo['grade'] == null ||
        classInfo['class'] == '' ||
        classInfo['class'] == null ||
        classInfo['number'] == '' ||
        classInfo['number'] == null) {
      print(classInfo['grade']);
      print(classInfo['class']);
      print(classInfo['number']);
    } else {
      emit(EnableClassState());
    }
  }
}
