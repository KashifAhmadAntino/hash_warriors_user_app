import 'package:flutter/material.dart';
import 'package:user_voting_app/feature/auth/screen/home_screen.dart';
import 'package:user_voting_app/feature/auth/screen/login_screen.dart';
import 'package:user_voting_app/feature/auth/screen/otp-screen.dart';
import 'package:user_voting_app/feature/voting/screens/vote_submit_screen.dart';
import 'package:user_voting_app/feature/voting/screens/voting_screen.dart';
import 'package:user_voting_app/main.dart';

abstract class RouteName {
  static const loginScreen = '/login';
  static const homeScreen = '/home';
  static const voteScreen = '/voteScreen';
  static const voteSubmitScreen = '/voteSubmitScreen';
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
    } else if (route == RouteName.voteScreen) {
      return MaterialPageRoute(
        builder: (
          BuildContext context,
        ) =>
            const VotingScreen(),
      );
    } else if (route == RouteName.voteSubmitScreen) {
      final VotingScreenParms parms = settings.arguments as VotingScreenParms;
      return MaterialPageRoute(
        builder: (
          BuildContext context,
        ) =>
            VoteSubmitScreen(
          parms: parms,
        ),
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
