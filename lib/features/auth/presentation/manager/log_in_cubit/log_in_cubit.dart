import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/features/auth/data/models/log_in_request_model.dart';
import 'package:tasketo/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:tasketo/features/auth/presentation/manager/log_in_cubit/log_in_states.dart';

class LogInCubit extends Cubit<LogInState> {
  final AuthRepo repo;
  LogInCubit({required this.repo}) : super(LogInInitialState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  logIn({required String email, required String password}) async {
    emit(LogInLoadingState());
    final result = await repo.logIn(
      request: LogInRequestModel(
        email: email,
        password: password,
      ),
    );
    result.fold(
      (user) => emit(LogInSuccessState(userData: user.data!)),
      (failure) => emit(
        LogInErrorState(
          message: failure.error.message ?? 'An Error Happen',
        ),
      ),
    );
  }
}
