part of '../../sign_up_presentation.dart';

class SexBloc extends Bloc<SexEvent, SexState> {
  Sex? sex;

  SexBloc(this.sex) : super(DisableSexState()) {
    on<SexEnterMaleEvent>(_handleSexEnterMaleEvent);
    on<SexEnterFemaleEvent>(_handleSexEnterFemaleEvent);
    on<PersonalInformationEvent>(_handlePersonalInformationEvent);
  }

  void _handleSexEnterMaleEvent(SexEvent event, Emitter<SexState> emit) {
    sex = Sex.male;
    emit(EnterSexState());
  }

  void _handleSexEnterFemaleEvent(SexEvent event, Emitter<SexState> emit) {
    sex = Sex.female;
    emit(EnterSexState());
  }

  void _handlePersonalInformationEvent(SexEvent event, Emitter<SexState> emit) {
    state is EnterSexState ? emit(EnableSexState()) : emit(EnterSexState());
  }
}
