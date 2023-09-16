import 'package:flutter/material.dart';
import 'package:user_voting_app/feature/auth/screen/login_screen.dart';
import 'package:user_voting_app/main.dart';

abstract class RouteName {
  static const loginScreen = '/login';
  static const homeScreen = '/home';

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
            LoginScreen(),
      );
    }
    return MaterialPageRoute(
      builder: (
        BuildContext context,
      ) =>
          MyHomePage(title: ""),
    );
  }
}
