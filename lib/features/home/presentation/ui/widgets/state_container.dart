import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/features/home/data/enum/task_states_enum.dart';

class StateContainer extends StatelessWidget {
  const StateContainer({super.key, required this.taskState});

  final TaskStatesEnum taskState;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: addBackground(),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        taskStatesValues[taskState]!,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: AppColorHelper.white,
        ),
      ),
    );
  }

  addBackground(){
    switch(taskState){
      case TaskStatesEnum.all:
        return AppColorHelper.primary;
      case TaskStatesEnum.inProgress:
        return AppColorHelper.green;
      case TaskStatesEnum.waiting:
        return AppColorHelper.blue;
      case TaskStatesEnum.finished:
        return AppColorHelper.grey;
    }
  }
}
