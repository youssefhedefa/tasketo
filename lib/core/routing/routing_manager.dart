import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasketo/core/di/di.dart';
import 'package:tasketo/core/routing/custom_page_route.dart';
import 'package:tasketo/core/routing/routing_constances.dart';
import 'package:tasketo/features/auth/presentation/manager/log_in_cubit/log_in_cubit.dart';
import 'package:tasketo/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:tasketo/features/auth/presentation/ui/forms/log_in_form.dart';
import 'package:tasketo/features/auth/presentation/ui/forms/sign_up_form.dart';
import 'package:tasketo/features/auth/presentation/ui/on_boarding_view.dart';
import 'package:tasketo/features/home/presentation/manager/get_tasks_cubit/get_tasks_cubit.dart';
import 'package:tasketo/features/home/presentation/ui/home_view.dart';

class AppRoutingManager {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutingConstances.onboarding:
        return CustomPageRoute(
          child: const OnBoardingView(),
          axisDirection: AxisDirection.down,
        );
      case AppRoutingConstances.logIn:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => getIt<LogInCubit>(),
            child: const LogInForm(),
          ),
          axisDirection: AxisDirection.left,
        );
      case AppRoutingConstances.signUp:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => getIt<SignUpCubit>(),
            child: const SignUpForm(),
          ),
          axisDirection: AxisDirection.left,
        );
      case AppRoutingConstances.home:
        return CustomPageRoute(
          child: BlocProvider(
            create: (context) => getIt<GetTasksCubit>()..getUserTasks(),
              child: const HomeView(),
          ),
          axisDirection: AxisDirection.left,
        );
      default:
        return null;
    }
  }
}
