import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';


class CustomPasswordInputField extends StatefulWidget {
  const CustomPasswordInputField({super.key, required this.label, required this.hint});

  final String label;
  final String hint;

  @override
  State<CustomPasswordInputField> createState() => _CustomPasswordInputFieldState();
}

class _CustomPasswordInputFieldState extends State<CustomPasswordInputField> {

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppTextStyleHelper.font18MediumPrimary,
        ),
        const SizedBox(height: 12),
        TextFormField(
          obscureText: _isObscure,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: Icon(
                  !_isObscure ?  Icons.visibility_off_rounded :Icons.visibility_rounded
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
            hintText: widget.hint,
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
