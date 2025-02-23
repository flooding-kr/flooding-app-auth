part of '../sign_in_presentation.dart';

abstract class SignInEvent{}

class SignInLoadingEvent extends SignInEvent{}

class SignInSuccessEvent extends SignInEvent{}

class SignInErrorEvent extends SignInEvent{}

class EmailEnterEvent extends SignInEvent {}

class PasswordEnterEvent extends SignInEvent {}

