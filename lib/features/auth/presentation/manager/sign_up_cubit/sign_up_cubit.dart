import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/features/auth/data/models/sign_up_request_model.dart';
import 'package:tasketo/features/auth/domain/auth_repo/auth_repo.dart';
import 'package:tasketo/features/auth/presentation/manager/sign_up_cubit/sign_up_states.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo repo;

  SignUpCubit({required this.repo}) : super(SignUpInitialState());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();

  Future<void> signUp(
      {required String email,
      required String password,
      required String fullName,
        required String confirmPassword,
      }) async {
    emit(SignUpLoadingState());
    final result = await repo.signUp(
      request: SignUpRequestModel(
        email: email,
        password: password,
        fullName: fullName,
        confirmPassword: confirmPassword,
      ),
    );
    result.fold(
      (user) => emit(SignUpSuccessState(userData: user.data!)),
      (failure) => emit(
        SignUpErrorState(
          message: failure.error.message ?? 'An Error Happen',
        ),
      ),
    );
  }
}
