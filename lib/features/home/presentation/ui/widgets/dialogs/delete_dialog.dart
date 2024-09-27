import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/di/di.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/error_dialog.dart';
import 'package:tasketo/features/home/presentation/manager/delete_task_cubit/delete_task_cubit.dart';
import 'package:tasketo/features/home/presentation/manager/delete_task_cubit/delete_task_states.dart';

Future showDeleteTaskDialog({required BuildContext context,required int taskId}) {
  return showDialog(
    context: context,
    builder: (context) {
      return BlocProvider(
        create: (context) => getIt<DeleteTaskCubit>(),
        child: Builder(builder: (context) {
          return AlertDialog(
            backgroundColor: AppColorHelper.white,
            elevation: 0,
            title: const Text('Delete Task'),
            content: const Text('Are you sure you want to delete this task?'),
            actions: [
              BlocConsumer<DeleteTaskCubit, DeleteTaskState>(
                builder: (context, state) {
                  if (state is DeleteTaskLoadingState) {
                    return CustomButton(
                        onPressed: () {}, label: 'Yes', isLoading: true);
                  }
                  return CustomButton(
                    onPressed: () {
                      context.read<DeleteTaskCubit>().deleteTask(taskId: taskId);
                    },
                    label: 'Yes',
                    isLoading: false,
                  );
                },
                listener: (context, state) {
                  if (state is DeleteTaskSuccessState) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColorHelper.green,
                        content: Text(
                          state.message,
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  }
                  if (state is DeleteTaskErrorState) {
                    showErrorDialog(context: context, error: state.message);
                  }
                },
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                label: 'No',
                isLoading: false,
              ),
            ],
          );
        }),
      );
    },
  );
}
