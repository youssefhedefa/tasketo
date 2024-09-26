import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/features/home/data/enum/task_states_enum.dart';
import 'package:tasketo/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/task_state.dart';

class TaskStatesList extends StatefulWidget {
  const TaskStatesList({super.key, });


  @override
  State<TaskStatesList> createState() => _TaskStatesListState();
}

class _TaskStatesListState extends State<TaskStatesList> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => buildTaskState(index),
        separatorBuilder: (context, index) => const SizedBox(
          width: 8,
        ),
        itemCount: 4,
      ),
    );
  }

  buildTaskState(int index) {
    List<String?> titles = [
      taskStatesValues[TaskStatesEnum.all],
      taskStatesValues[TaskStatesEnum.inProgress],
      taskStatesValues[TaskStatesEnum.waiting],
      taskStatesValues[TaskStatesEnum.finished]
    ];
    List<TaskStatesEnum?> statues = [
      TaskStatesEnum.all,
      TaskStatesEnum.inProgress,
      TaskStatesEnum.waiting,
      TaskStatesEnum.finished
    ];
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        context.read<GetTasksCubit>().getTasksByState(state: statues[index] ?? TaskStatesEnum.all);
      },
      child: TaskState(
        title: titles[index]!,
        isSelected: index == selectedIndex,
      ),
    );
  }
}
