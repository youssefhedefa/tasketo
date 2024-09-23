import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';


class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key, required this.label, required this.hint, required this.controller, required this.validatorText});

  final String label;
  final String hint;
  final TextEditingController controller;
  final String validatorText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyleHelper.font18MediumPrimary,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return validatorText;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            border: focusedBorder(),
            enabledBorder: focusedBorder(),
            focusedBorder: focusedBorder(),
          ),
        ),
      ],
    );
  }
  OutlineInputBorder focusedBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      borderSide: BorderSide(
        color: AppColorHelper.primary,
        width: 2,
      ),
    );
  }
}
