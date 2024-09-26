import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasketo/core/networking/api_constances.dart';
import 'package:tasketo/features/home/data/models/get_tasks_model.dart';

part 'home_api.g.dart';

@RestApi(baseUrl: ApiConstances.baseUrl)
abstract class HomeApiService {
  factory HomeApiService(
    Dio dio,
  ) = _HomeApiService;

  @GET(ApiConstances.getTasks)
  Future<GetTasksResponseModel> getTasks({
    @Body() required GetTasksRequestModel userId,
  });
}
