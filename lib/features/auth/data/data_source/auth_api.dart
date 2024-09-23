import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tasketo/core/networking/api_constances.dart';
import 'package:tasketo/core/networking/models/parse_error_logger.dart';
import 'package:tasketo/features/auth/data/models/auth_response_model.dart';
import 'package:tasketo/features/auth/data/models/log_in_request_model.dart';
import 'package:tasketo/features/auth/data/models/sign_up_request_model.dart';
part 'auth_api.g.dart';

@RestApi(baseUrl: ApiConstances.baseUrl)
abstract class AuthApiServices {
  factory AuthApiServices(Dio dio) = _AuthApiServices;

  @POST(ApiConstances.signUp)
  Future<AuthResponseModel> signUp({
    @Body() required SignUpRequestModel request,
  });

  @POST(ApiConstances.logIn)
  Future<AuthResponseModel> logIn({
    @Body() required LogInRequestModel request,
  });
}
