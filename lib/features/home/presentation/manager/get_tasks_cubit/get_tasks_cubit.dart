import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/features/home/data/enum/task_states_enum.dart';
import 'package:tasketo/features/home/data/mapper/to_task_entity.dart';
import 'package:tasketo/features/home/domain/entities/task_entity.dart';
import 'package:tasketo/features/home/domain/repo/home_repo.dart';
import 'package:tasketo/features/home/presentation/manager/get_tasks_cubit/get_tasks_states.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit({required this.repo}) : super(GetTasksInitialState());
  final HomeRepo repo;

  List<TaskEntity> userTasks = [];

  Future getUserTasks() async {
    emit(GetTasksLoadingState());
    final result = await repo.getTasks();
    result.fold(
      (tasks) {
        userTasks = tasks;
        sortTasksByDate(tasks: tasks);
      },
      (failure) => emit(
        GetTasksErrorState(
            message: failure.error.message ?? 'An error occurred'),
      ),
    );
  }

  getTasksByState({required TaskStatesEnum state}) async {
    emit(GetTasksLoadingState());
    if (state == TaskStatesEnum.all) {
      sortTasksByDate(tasks: userTasks);
      return;
    }
    final tasks = userTasks
        .where(
            (element) => ToTaskEntityList.getStateEnum(element.state) == state)
        .toList();
    sortTasksByDate(tasks: tasks);
  }

  sortTasksByDate({required List<TaskEntity> tasks}) {
    tasks.sort((a, b) => a.deadline.compareTo(b.deadline));
    tasks = tasks.reversed.toList();
    emit(GetTasksSuccessState(tasks: tasks));
  }

}
