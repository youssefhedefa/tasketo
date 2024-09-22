import 'package:flutter/material.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/helper/image_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';
import 'package:tasketo/core/routing/routing_constances.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 44, vertical: 100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              AppImageHelper.onBoardingImage,
            ),
            const SizedBox(height: 60),
            const Text(
              'Welcome to Tasketo',
              style: AppTextStyleHelper.font22BoldPrimary,
            ),
            const SizedBox(height: 32),
            const Text(
              'Your Way to organize your tasks and get things done faster',
              textAlign: TextAlign.center,
              style: AppTextStyleHelper.font20RegularBlack,
            ),
            const SizedBox(height: 80),
            CustomButton(
              onPressed: () {
                Navigator.pushNamed(context, AppRoutingConstances.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
