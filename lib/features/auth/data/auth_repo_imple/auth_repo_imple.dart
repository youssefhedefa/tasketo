import 'package:either_dart/src/either.dart';
import 'package:tasketo/core/networking/models/error_model.dart';
import 'package:tasketo/features/auth/data/data_source/auth_api.dart';
import 'package:tasketo/features/auth/data/models/auth_response_model.dart';
import 'package:tasketo/features/auth/data/models/log_in_request_model.dart';
import 'package:tasketo/features/auth/data/models/sign_up_request_model.dart';
import 'package:tasketo/features/auth/domain/auth_repo/auth_repo.dart';

class AuthRepoImple implements AuthRepo{

  final AuthApiServices apiServices;

  AuthRepoImple({required this.apiServices});

  @override
  Future<Either<AuthResponseModel, Failure>> signUp({required SignUpRequestModel request}) async {
    try{
      final result = await apiServices.signUp(request: request);
      return Left(result);
    }catch(error){
      return Right(Failure.fromApi(error));
    }
  }

  @override
  Future<Either<AuthResponseModel, Failure>> logIn({required LogInRequestModel request}) async {
    try{
      final result = await apiServices.logIn(request: request);
      return Left(result);
    }catch(error){
      return Right(Failure.fromApi(error));
    }
  }



}