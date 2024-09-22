import 'package:flutter/material.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/routing/routing_constances.dart';
import 'package:tasketo/features/auth/presentation/ui/auth_view.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/auth_footer.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_input_field.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_password_input_field.dart';


class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthView(
      formTitle: 'Welcome Back',
      formSubTitle: 'Log in to your account',
      form: Column(
        children: [

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
            onPressed: () {
              Navigator.pushNamed(context, AppRoutingConstances.signUp);
            },
          )
        ],
      ),
    );
  }
}
