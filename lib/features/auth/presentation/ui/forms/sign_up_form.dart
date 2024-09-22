import 'package:flutter/material.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/routing/routing_constances.dart';
import 'package:tasketo/features/auth/presentation/ui/auth_view.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/auth_footer.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_input_field.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_password_input_field.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthView(
      formTitle: 'Hi there!',
      formSubTitle: 'Create an account to get started',
      form: Column(
        children: [
          const CustomInputField(
            label: 'Full name',
            hint: 'Enter your full name',
          ),
          const SizedBox(
            height: 20,
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
            height: 20,
          ),
          const CustomPasswordInputField(
            label: 'Confirm password',
            hint: 'Enter your password again',
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
            notClickable: 'Have an account already?',
            clickable: 'Log in now',
            onPressed: () {
              Navigator.pushNamed(context, AppRoutingConstances.logIn);
            },
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
