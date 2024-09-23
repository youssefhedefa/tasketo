import 'package:tasketo/features/auth/data/models/auth_response_model.dart';

abstract class LogInState{}

class LogInInitialState extends LogInState{}

class LogInLoadingState extends LogInState{}

class LogInSuccessState extends LogInState{
  final UserData userData;
  LogInSuccessState({required this.userData});
}

class LogInErrorState extends LogInState{
  final String message;

  LogInErrorState({required this.message});
}
