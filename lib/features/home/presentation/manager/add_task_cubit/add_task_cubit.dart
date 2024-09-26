import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/networking/local_storage/app_local_storage.dart';
import 'package:tasketo/features/home/data/enum/task_states_enum.dart';
import 'package:tasketo/features/home/data/models/add_task_request.dart';
import 'package:tasketo/features/home/domain/repo/home_repo.dart';
import 'package:tasketo/features/home/presentation/manager/add_task_cubit/add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  final HomeRepo repo;

  AddTaskCubit({required this.repo}) : super(AddTaskInitialState());

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  String stateController =
      taskStatesValues[TaskStatesEnum.waiting]?.toLowerCase() ?? 'waiting';
  String deadlineController = DateTime.now().toString();

  addTask({
    required String title,
    required String description,
    required String state,
    required String deadline,
  }) async {
    emit(AddTaskLoadingState());
    final uid = AppLocalStorageHelper.getId();
    final response = await repo.addTask(
      task: AddTaskRequestModel(
        uid: uid,
        title: title,
        description: description,
        state: state,
        deadline: deadline,
      ),
    );
    response.fold(
      (data) {
        emit(AddTaskSuccessState(
            message: data.data ?? 'Task Added Successfully'));
      },
      (error) {
        emit(AddTaskErrorState(
            message: error.error.message ?? 'Error Occurred'));
      },
    );
  }
}
