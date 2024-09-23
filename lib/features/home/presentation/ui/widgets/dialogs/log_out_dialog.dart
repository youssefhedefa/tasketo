import 'package:flutter/material.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/helper/color_helper.dart';

showLogOutTaskDialog({required BuildContext context}){
  return showDialog(
    context: context,
    builder: (context){
      return AlertDialog(
        backgroundColor: AppColorHelper.white,
        elevation: 0,
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          CustomButton(onPressed: (){}, label: 'Yes', isLoading: false),
          const SizedBox(height: 10,),
          CustomButton(onPressed: (){
            Navigator.pop(context);
          }, label: 'No', isLoading: false,),
        ],
      );
    },
  );
}