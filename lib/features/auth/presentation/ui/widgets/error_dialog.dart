import 'package:flutter/material.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/helper/color_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';

showErrorDialog({required BuildContext context, required String error}){
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColorHelper.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: const Text(
          'Error',
        style: AppTextStyleHelper.font20MediumBlack,
      ),
      content: Text(
          error,
        style: AppTextStyleHelper.font18RegularGrey,
      ),
      actions: [
        CustomButton(
          onPressed: (){
            Navigator.pop(context);
          },
          label: 'ok',
          isLoading: false,
        ),
      ],
    ),
  );
}