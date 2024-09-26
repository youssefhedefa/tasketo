import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/routing/routing_constances.dart';
import 'package:tasketo/features/auth/presentation/manager/log_in_cubit/log_in_cubit.dart';
import 'package:tasketo/features/auth/presentation/manager/log_in_cubit/log_in_states.dart';
import 'package:tasketo/features/auth/presentation/ui/auth_view.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/auth_footer.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_input_field.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_password_input_field.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/error_dialog.dart';


class LogInForm extends StatelessWidget {
  const LogInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthView(
      formTitle: 'Welcome Back',
      formSubTitle: 'Log in to your account',
      form: Form(
        key: context.read<LogInCubit>().formKey,
        child: Column(
          children: [
            CustomInputField(
              label: 'Email',
              hint: 'Enter your email',
              controller: context.read<LogInCubit>().emailController,
              validatorText: 'Please enter your email',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomPasswordInputField(
              label: 'Password',
              hint: 'Enter your password',
              controller: context.read<LogInCubit>().passwordController,
              validatorText: 'Please enter your password',
            ),
            const SizedBox(
              height: 66,
            ),
            BlocConsumer<LogInCubit, LogInState>(
              builder: (context, state) {
                if (state is LogInLoadingState) {
                  return CustomButton(
                    onPressed: () {},
                    label: 'Log in',
                    isLoading: true,
                  );
                }
                return CustomButton(
                  onPressed: () {
                    logInAction(context: context);
                  },
                  label: 'Log in',
                  isLoading: false,
                );
              },
              listener: (context, state) {
                if (state is LogInSuccessState) {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutingConstances.home, (route) => false);
                  // showErrorDialog(context: context, error: 'Success');
                }
                if (state is LogInErrorState) {
                  showErrorDialog(context: context, error: state.message);
                }
              },
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
      ),
    );
  }

  logInAction({required BuildContext context}) {
    if (context
        .read<LogInCubit>()
        .formKey
        .currentState!
        .validate()) {
      context.read<LogInCubit>().logIn(
        email: context
            .read<LogInCubit>()
            .emailController
            .text,
        password: context
            .read<LogInCubit>()
            .passwordController
            .text,
      );
    }
  }
}
