import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/di/di.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_input_field.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/error_dialog.dart';
import 'package:tasketo/features/home/data/enum/task_states_enum.dart';
import 'package:tasketo/features/home/domain/entities/task_entity.dart';
import 'package:tasketo/features/home/presentation/manager/edit_task_cubit/edit_task_cubit.dart';
import 'package:tasketo/features/home/presentation/manager/edit_task_cubit/edit_task_states.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/custom_date_shower.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/custom_state_picker_widget.dart';

Future editTaskDialog({
  required BuildContext context,
  required TaskEntity task,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context)=> getIt<EditTaskCubit>(),
        child: Builder(
          builder: (context) {
            context.read<EditTaskCubit>().titleController.text = task.title;
            context.read<EditTaskCubit>().descriptionController.text = task.description;
            context.read<EditTaskCubit>().stateController = task.state;
            context.read<EditTaskCubit>().deadlineController = task.deadline;
            return AlertDialog(
              title: const Text(
                'Edit Task',
                style: AppTextStyleHelper.font22BoldPrimary,
              ),
              backgroundColor: AppColorHelper.white,
              elevation: 0,
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomInputField(
                    label: 'Title',
                    hint: 'Enter task title',
                    controller: context.read<EditTaskCubit>().titleController,
                    validatorText: '',
                  ),
                  const SizedBox(height: 16),
                  CustomInputField(
                    label: 'Description',
                    hint: 'Enter task description',
                    controller: context.read<EditTaskCubit>().descriptionController,
                    validatorText: '',
                  ),
                  const SizedBox(height: 16),
                  CustomPriorityContainer(
                    label: 'State',
                    callback: (value) {
                      context.read<EditTaskCubit>().stateController = value;
                    },
                    options: [
                      taskStatesValues[TaskStatesEnum.waiting]!,
                      taskStatesValues[TaskStatesEnum.finished]!,
                      taskStatesValues[TaskStatesEnum.inProgress]!,
                    ],
                  ),
                  const SizedBox(height: 16),
                  CustomDateShower(
                    label: context.read<EditTaskCubit>().deadlineController,
                    callback: (value) {
                      //print(value);
                      context.read<EditTaskCubit>().deadlineController = value;
                    },
                  ),
                ],
              ),
              actions: [
                BlocConsumer<EditTaskCubit,EditTaskState>(
                  builder: (context,state) {
                    if(state is EditTaskLoadingState){
                      return CustomButton(
                        label: 'Add',
                        onPressed: () {},
                        isLoading: true,
                      );
                    }
                    return CustomButton(
                      label: 'Add',
                      onPressed: () {
                        context.read<EditTaskCubit>().editTask(
                            taskId: task.taskId,
                            title: context.read<EditTaskCubit>().titleController.text,
                            description: context.read<EditTaskCubit>().descriptionController.text,
                            state: context.read<EditTaskCubit>().stateController.toLowerCase(),
                            deadline: context.read<EditTaskCubit>().deadlineController,
                        );
                      },
                      isLoading: false,
                    );
                  },
                  listener: (context,state) {
                    if(state is EditTaskSuccessState){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: AppColorHelper.green,
                          content: Text(state.message),
                        ),
                      );
                      Navigator.pop(context);
                    }
                    if(state is EditTaskErrorState){
                      showErrorDialog(context: context, error: state.message);
                    }
                  },
                ),
              ],
            );
          }
        ),
      );
    },
  );
}
