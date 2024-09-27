import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';
import 'package:tasketo/features/home/data/mapper/to_task_entity.dart';
import 'package:tasketo/features/home/domain/entities/task_entity.dart';
import 'package:tasketo/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/dialogs/delete_dialog.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/dialogs/edit_dialog.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/dialogs/view_dialog.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/state_container.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task});

  final TaskEntity task;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialogDetails(
          context: context,
          title: task.title,
          description: task.description,
          date: task.deadline,
          state: task.state,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 204,
        decoration: BoxDecoration(
          color: AppColorHelper.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: AppColorHelper.grey.withOpacity(0.35),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - (180),
                  child: Text(
                    task.title,
                    style: AppTextStyleHelper.font20SemiBoldBlack,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    editTaskDialog(context: context, task: task).then((value) {
                      context.read<GetTasksCubit>().getUserTasks();
                    });
                  },
                  icon: const Icon(
                    Icons.edit_note_rounded,
                    color: AppColorHelper.green,
                    size: 34,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    showDeleteTaskDialog(
                      context: context,
                      taskId: task.taskId,
                    ).then((value) {
                      context.read<GetTasksCubit>().getUserTasks();
                    });
                  },
                  icon: const Icon(
                    Icons.delete_rounded,
                    color: AppColorHelper.red,
                    size: 30,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(task.deadline,
                    style: AppTextStyleHelper.font16RegularGrey),
                const Flexible(child: SizedBox(width: 50)),
                StateContainer(
                    taskState: ToTaskEntityList.getStateEnum(task.state)),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              task.description,
              style: AppTextStyleHelper.font16RegularGrey,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
