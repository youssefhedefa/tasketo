import 'package:flutter/material.dart';
import 'package:tasketo/core/routing/custom_page_route.dart';
import 'package:tasketo/core/routing/routing_constances.dart';
import 'package:tasketo/features/auth/presentation/ui/log_in_view.dart';
import 'package:tasketo/features/auth/presentation/ui/on_boarding_view.dart';

class AppRoutingManager {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutingConstances.onboarding:
        return CustomPageRoute(
          child: const OnBoardingView(),
          axisDirection: AxisDirection.down,
        );
      case AppRoutingConstances.login:
        return CustomPageRoute(
          child: const LogInView(),
          axisDirection: AxisDirection.left,
        );
      default:
        return null;
    }
  }
}
