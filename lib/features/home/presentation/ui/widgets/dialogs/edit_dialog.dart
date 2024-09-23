import 'package:flutter/material.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_input_field.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/custom_date_shower.dart';
import 'package:tasketo/features/home/presentation/ui/widgets/custom_state_picker_widget.dart';

editTaskDialog({required BuildContext context}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
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
              controller: TextEditingController(),
              validatorText: '',
            ),
            const SizedBox(height: 16),
            CustomInputField(
              label: 'Description',
              hint: 'Enter task description',
              controller: TextEditingController(),
              validatorText: '',
            ),
            const SizedBox(height: 16),
            CustomPriorityContainer(
              label: 'State',
              callback: (value) {
                print(value);
              },
              options: const ['In Progress', 'Waiting', 'Finished'],
            ),
            const SizedBox(height: 16),
            CustomDateShower(
              label: 'Date',
              callback: (value) {
                print(value);
              },
            ),
          ],
        ),
        actions: [
          CustomButton(
            label: 'Add',
            onPressed: () {},
            isLoading: false,
          ),
        ],
      );
    },
  );
}
