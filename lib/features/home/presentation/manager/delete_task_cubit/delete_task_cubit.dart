import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/networking/local_storage/app_local_storage.dart';
import 'package:tasketo/features/home/data/models/delete_task_request.dart';
import 'package:tasketo/features/home/domain/repo/home_repo.dart';
import 'package:tasketo/features/home/presentation/manager/delete_task_cubit/delete_task_states.dart';

class DeleteTaskCubit extends Cubit<DeleteTaskState> {
  final HomeRepo repo;

  DeleteTaskCubit({required this.repo}) : super(DeleteTaskInitialState());

  Future<void> deleteTask({required int taskId}) async {
    emit(DeleteTaskLoadingState());
    final userId = AppLocalStorageHelper.getId();
    final response = await repo.deleteTask(
      request: DeleteTaskRequestModel(
        userId: userId,
        taskId: taskId,
      ),
    );
    response.fold(
      (data) {
        emit(
          DeleteTaskSuccessState(
            message: data.data ?? 'Task Deleted Successfully',
          ),
        );
      },
      (error) {
        emit(
          DeleteTaskErrorState(
            message: error.error.message ?? 'Error Deleting Task',
          ),
        );
      },
    );
  }
}
