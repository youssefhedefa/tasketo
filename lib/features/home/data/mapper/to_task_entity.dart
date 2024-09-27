import 'package:tasketo/features/home/data/enum/task_states_enum.dart';
import 'package:tasketo/features/home/data/models/get_tasks_model.dart';
import 'package:tasketo/features/home/domain/entities/task_entity.dart';

class ToTaskEntityList {
  static List<TaskEntity> call(List<TaskData> tasks) {
    return tasks
        .map(
          (task) => TaskEntity(
            taskId: task.taskId ?? 0,
            title: task.title ?? 'Not Found',
            description: task.description ?? 'Not Found',
            state: task.state ?? 'Not Found',
            deadline: getFormattedDate(task.deadline ?? ''),
          ),
        )
        .toList();
  }

  static String getFormattedDate(String date) {
    final dateParts = date.split(' ');
    final formattedDate = dateParts[0].replaceAll('-', '/');
    return formattedDate;
  }

  static getStateEnum(String state) {
    switch (state.toLowerCase()) {
      case 'all':
        return TaskStatesEnum.all;
      case 'in Progress':
        return TaskStatesEnum.inProgress;
      case 'waiting':
        return TaskStatesEnum.waiting;
      case 'finished':
        return TaskStatesEnum.finished;
      default:
        return TaskStatesEnum.inProgress;
    }
  }
}
