import 'package:flutter/material.dart';
import 'package:tasketo/core/helper/image_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key, required this.formTitle, required this.form, required this.formSubTitle});

  final String formTitle;
  final String formSubTitle;
  final Widget form;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 18,right: 18 ,top: 90),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                AppImageHelper.appBlackLogo,
                width: 120,
                height: 120,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                formTitle,
                style: AppTextStyleHelper.font22BoldPrimary,
              ),
               Text(
                 formSubTitle,
                style: AppTextStyleHelper.font20MediumPrimary,
              ),
              const SizedBox(
                height: 50,
              ),
              form,
            ],
          ),
        ),
      ),
    );
  }
}
