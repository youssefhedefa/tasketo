import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tasketo/core/networking/api_constances.dart';
import 'package:tasketo/features/home/data/models/add_task_request.dart';
import 'package:tasketo/features/home/data/models/alter_task_response.dart';
import 'package:tasketo/features/home/data/models/delete_task_request.dart';
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

  @POST(ApiConstances.addTask)
  Future<AlterTaskResponseModel> addTask({
    @Body() required AddTaskRequestModel task,
  });

  @DELETE(ApiConstances.deleteTask)
  Future<AlterTaskResponseModel> deleteTask({
    @Body() required DeleteTaskRequestModel request,
  });


}
