import 'package:either_dart/either.dart';
import 'package:tasketo/core/networking/models/error_model.dart';
import 'package:tasketo/features/home/data/models/add_task_request.dart';
import 'package:tasketo/features/home/data/models/alter_task_response.dart';
import 'package:tasketo/features/home/data/models/delete_task_request.dart';
import 'package:tasketo/features/home/data/models/update_task_request.dart';
import 'package:tasketo/features/home/domain/entities/task_entity.dart';

abstract class HomeRepo {
  Future<Either<List<TaskEntity>,Failure>> getTasks();
  Future<Either<AlterTaskResponseModel,Failure>> addTask({required AddTaskRequestModel task});
  Future<Either<AlterTaskResponseModel,Failure>> deleteTask({required DeleteTaskRequestModel request});
  Future<Either<AlterTaskResponseModel,Failure>> editTask({required EditTaskRequestModel request});

}