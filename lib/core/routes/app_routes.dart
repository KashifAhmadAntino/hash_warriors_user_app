import 'package:flutter/material.dart';
import 'package:user_voting_app/feature/auth/screen/home_screen.dart';
import 'package:user_voting_app/feature/auth/screen/login_screen.dart';
import 'package:user_voting_app/feature/auth/screen/otp-screen.dart';
import 'package:user_voting_app/main.dart';

abstract class RouteName {
  static const loginScreen = '/login';
  static const homeScreen = '/home';
  static const otpScreen = '/otp';

  RouteName._();
}

class GenerateRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final route = settings.name;
    if (route == RouteName.loginScreen) {
      return MaterialPageRoute(
        builder: (
          BuildContext context,
        ) =>
            const LoginScreen(),
      );
    }
    if (route == RouteName.otpScreen) {
      return MaterialPageRoute(
        builder: (
          BuildContext context,
        ) =>
            const OtpScreen(),
      );
    }
    return MaterialPageRoute(
      builder: (
        BuildContext context,
      ) =>
          const HomeScreen(),
    );
  }
}
