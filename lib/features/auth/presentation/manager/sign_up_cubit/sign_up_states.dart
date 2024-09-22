import 'package:tasketo/features/auth/data/models/auth_response_model.dart';

abstract class SignUpState{}

class SignUpInitialState extends SignUpState{}

class SignUpLoadingState extends SignUpState{}

class SignUpSuccessState extends SignUpState{
  final UserData userData;

  SignUpSuccessState({required this.userData});
}

class SignUpErrorState extends SignUpState{
  final String message;

  SignUpErrorState({required this.message});
}