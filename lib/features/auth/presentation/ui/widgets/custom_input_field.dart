import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';


class CustomInputField extends StatelessWidget {
  const CustomInputField({super.key, required this.label, required this.hint});

  final String label;
  final String hint;

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
