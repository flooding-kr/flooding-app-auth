part of '../../sign_up_presentation.dart';

enum Sex { male, female }

abstract class SexState {}

class EnableSexState extends SexState {}

class EnterSexState extends SexState {}

class DisableSexState extends SexState {}
