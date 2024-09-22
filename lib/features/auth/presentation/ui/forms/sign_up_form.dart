import 'package:flutter/material.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/helper/image_helper.dart';
import 'package:tasketo/core/helper/text_style_helper.dart';
import 'package:tasketo/features/auth/presentation/ui/auth_view.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/auth_footer.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_input_field.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_password_input_field.dart';


class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthView(
      formTitle: 'Log In',
      formSubTitle: 'Log In',
      form: Column(
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
          const Text(
            'Welcome Back',
            style: AppTextStyleHelper.font22BoldPrimary,
          ),
          const Text(
            'Log in to your account',
            style: AppTextStyleHelper.font20MediumPrimary,
          ),
          const SizedBox(
            height: 50,
          ),
          const CustomInputField(
            label: 'Email',
            hint: 'Enter your email',
          ),
          const SizedBox(
            height: 20,
          ),
          const CustomPasswordInputField(
            label: 'Password',
            hint: 'Enter your password',
          ),
          const SizedBox(
            height: 66,
          ),
          CustomButton(
            onPressed: () {},
            label: 'Log in',
          ),
          const SizedBox(
            height: 20,
          ),
          AuthFooter(
            notClickable: 'Don’t have an account?',
            clickable: 'Sign up now',
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
