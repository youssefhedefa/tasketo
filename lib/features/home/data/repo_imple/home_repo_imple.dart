import 'package:either_dart/src/either.dart';
import 'package:tasketo/core/networking/local_storage/app_local_storage.dart';
import 'package:tasketo/core/networking/models/error_model.dart';
import 'package:tasketo/features/home/data/data_source/home_api.dart';
import 'package:tasketo/features/home/data/mapper/to_task_entity.dart';
import 'package:tasketo/features/home/data/models/get_tasks_model.dart';
import 'package:tasketo/features/home/domain/entities/task_entity.dart';
import 'package:tasketo/features/home/domain/repo/home_repo.dart';

class HomeRepoImple extends HomeRepo{
  final HomeApiService apiService;
  HomeRepoImple({required this.apiService});

  @override
  Future<Either<List<TaskEntity>, Failure>> getTasks() async {
    try{
      final id =  AppLocalStorageHelper.getId();
      final response = await apiService.getTasks(
        userId: GetTasksRequestModel(uid: id),
      );
      List<TaskEntity> tasks = ToTaskEntityList.call(response.data);
      return Left(tasks);
    }catch(e){
      return Right(Failure.fromApi(e));
    }
  }

}