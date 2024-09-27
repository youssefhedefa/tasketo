import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/di/di.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_input_field.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/error_dialog.dart';
import 'package:tasketo/features/home/presentation/manager/add_task_cubit/add_task_cubit.dart';
import 'package:tasketo/features/home/presentation/manager/add_task_cubit/add_task_state.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/custom_date_shower.dart';

Future addTaskDialog({required BuildContext context}) {
  return showDialog(
      context: context,
      builder: (context) {
        return BlocProvider(
          create: (context) => getIt<AddTaskCubit>(),
          child: Builder(
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: const Text(
                    'Add Task',
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
                      controller: context.read<AddTaskCubit>().titleController,
                      validatorText: '',
                    ),
                    const SizedBox(height: 16),
                    CustomInputField(
                      label: 'Description',
                      hint: 'Enter task description',
                      controller: context.read<AddTaskCubit>().descriptionController,
                      validatorText: '',
                    ),
                    const SizedBox(height: 16),
                    CustomDateShower(
                      label: 'Date',
                      callback: (value) {
                        context.read<AddTaskCubit>().deadlineController = value;
                      },
                    ),
                  ],
                ),
                actions: [
                  BlocConsumer<AddTaskCubit,AddTaskState>(
                    builder: (context,state) {
                      if(state is AddTaskLoadingState) {
                        return CustomButton(
                          label: 'Add',
                          onPressed: () {},
                          isLoading: true,
                        );
                      }
                      return CustomButton(
                        label: 'Add',
                        onPressed: () {
                          context.read<AddTaskCubit>().addTask(
                            title: context.read<AddTaskCubit>().titleController.text,
                            description: context.read<AddTaskCubit>().descriptionController.text,
                            state: context.read<AddTaskCubit>().stateController,
                            deadline: context.read<AddTaskCubit>().deadlineController,
                          );
                        },
                        isLoading: false,
                      );
                    },
                    listener: (context,state) {
                      if(state is AddTaskSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(state.message),
                            backgroundColor: AppColorHelper.green,
                          ),
                        );
                        Navigator.pop(context);
                      }
                      if(state is AddTaskErrorState) {
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
