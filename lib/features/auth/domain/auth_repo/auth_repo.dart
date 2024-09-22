import 'package:either_dart/either.dart';
import 'package:tasketo/core/networking/models/error_model.dart';
import 'package:tasketo/features/auth/data/models/auth_response_model.dart';
import 'package:tasketo/features/auth/data/models/sign_up_request_model.dart';

abstract class AuthRepo{
  Future<Either<AuthResponseModel,Failure>> signUp({required SignUpRequestModel request});
}