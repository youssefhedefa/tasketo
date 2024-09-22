import 'package:either_dart/either.dart';
import 'package:tasketo/features/auth/data/models/sign_up_request_model.dart';

abstract class AuthRepo{
  Future<Either<void,void>> signUp({required SignUpRequestModel request});
}