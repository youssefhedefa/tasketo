import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/networking/local_storage/app_local_storage.dart';
import 'package:tasketo/features/home/data/enum/task_states_enum.dart';
import 'package:tasketo/features/home/data/models/update_task_request.dart';
import 'package:tasketo/features/home/domain/repo/home_repo.dart';
import 'package:tasketo/features/home/presentation/manager/edit_task_cubit/edit_task_states.dart';

class EditTaskCubit extends Cubit<EditTaskState> {
  final HomeRepo repo;
  EditTaskCubit({required this.repo}) : super(EditTaskInitialState());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String stateController = taskStatesValues[TaskStatesEnum.waiting]?.toLowerCase() ?? 'waiting';
  String deadlineController = DateTime.now().toString();

  void editTask({
    required int taskId,
    required String title,
    required String description,
    required String state,
    required String deadline,
  }) async {
    final userId = AppLocalStorageHelper.getId();
    emit(EditTaskLoadingState());
    final response = await repo.editTask(
      request: EditTaskRequestModel(
        userId: userId,
        taskId: taskId,
        title: title,
        description: description,
        state: state,
        deadline: deadline,
      ),
    );
    response.fold(
      (response) {
        emit(EditTaskSuccessState(message: response.data ?? 'Task Updated Successfully'));
      },
      (error) {
        emit(EditTaskErrorState(message: error.error.message ?? 'Error Updating Task'));
      },
    );
  }
}
