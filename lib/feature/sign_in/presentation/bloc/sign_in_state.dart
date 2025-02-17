part of '../sign_in_presentation.dart';

abstract class SignInState{}

class SignInInitState extends SignInState{}

class SignInLoadingState extends SignInState{}

class SignInSuccessState extends SignInState{}

class SignInErrorState extends SignInState{}
