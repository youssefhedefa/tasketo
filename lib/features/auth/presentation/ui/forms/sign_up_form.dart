import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/components/custom_button.dart';
import 'package:tasketo/core/routing/routing_constances.dart';
import 'package:tasketo/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:tasketo/features/auth/presentation/manager/sign_up_cubit/sign_up_states.dart';
import 'package:tasketo/features/auth/presentation/ui/auth_view.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/auth_footer.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_input_field.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/custom_password_input_field.dart';
import 'package:tasketo/features/auth/presentation/ui/widgets/error_dialog.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthView(
      formTitle: 'Hi there!',
      formSubTitle: 'Create an account to get started',
      form: Form(
        key: context.read<SignUpCubit>().formKey,
        child: Column(
          children: [
            CustomInputField(
              label: 'Full name',
              hint: 'Enter your full name',
              controller: context.read<SignUpCubit>().fullNameController,
              validatorText: 'Please enter your name',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomInputField(
              label: 'Email',
              hint: 'Enter your email',
              controller: context.read<SignUpCubit>().emailController,
              validatorText: 'Please enter your email',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomPasswordInputField(
              label: 'Password',
              hint: 'Enter your password',
              controller: context.read<SignUpCubit>().passwordController,
              validatorText: 'Please enter your password',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomPasswordInputField(
              label: 'Confirm password',
              hint: 'Enter your password again',
              controller: context.read<SignUpCubit>().passwordConfirmController,
              validatorText: 'Please enter your password again',
            ),
            const SizedBox(
              height: 66,
            ),
            BlocConsumer<SignUpCubit, SignUpState>(
              builder: (context, state) {
                if (state is SignUpLoadingState) {
                  return CustomButton(
                    onPressed: () {},
                    label: 'Sign up',
                    isLoading: true,
                  );
                }
                return CustomButton(
                  onPressed: () {
                    signUpAction(context: context);
                  },
                  label: 'Sign up',
                  isLoading: false,
                );
              },
              listener: (context, state) {
                if (state is SignUpSuccessState) {
                  // Navigator.pushNamed(context, AppRoutingConstances.home);
                  // showErrorDialog(context: context, error: 'Success');
                }
                if (state is SignUpErrorState) {
                  showErrorDialog(context: context, error: state.message);
                }
              },
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
      ),
    );
  }

  signUpAction({required BuildContext context}) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().signUp(
            email: context.read<SignUpCubit>().emailController.text,
            password: context.read<SignUpCubit>().passwordController.text,
            fullName: context.read<SignUpCubit>().fullNameController.text,
            confirmPassword:
                context.read<SignUpCubit>().passwordConfirmController.text,
          );
    }
  }
}
