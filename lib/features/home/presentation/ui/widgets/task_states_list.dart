import 'package:flutter/material.dart';
import 'package:tasketo/features/home/data/enum/task_states_enum.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/task_state.dart';

class TaskStatesList extends StatefulWidget {
  const TaskStatesList({super.key, required this.onTaskStateSelected});

  final Function onTaskStateSelected;

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
        widget.onTaskStateSelected(statues[index]);
      },
      child: TaskState(
        title: titles[index]!,
        isSelected: index == selectedIndex,
      ),
    );
  }
}
