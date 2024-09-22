import 'package:flutter/material.dart';
import 'package:tasketo/core/routing/custom_page_route.dart';
import 'package:tasketo/core/routing/routing_constances.dart';
import 'package:tasketo/features/auth/presentation/ui/forms/log_in_form.dart';
import 'package:tasketo/features/auth/presentation/ui/forms/sign_up_form.dart';
import 'package:tasketo/features/auth/presentation/ui/on_boarding_view.dart';

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
          child: const LogInForm(),
          axisDirection: AxisDirection.left,
        );
        case AppRoutingConstances.signUp:
        return CustomPageRoute(
          child: const SignUpForm(),
          axisDirection: AxisDirection.left,
        );
      default:
        return null;
    }
  }
}
