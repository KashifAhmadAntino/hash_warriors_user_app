import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_voting_app/core/analytics_helper.dart';
import 'package:user_voting_app/core/routes/app_routes.dart';
import 'package:user_voting_app/feature/auth/repository/auth_repository.dart';

class LoginController extends GetxController {
  final AuthRepository _authRepository;
  final TextEditingController otpController = TextEditingController();
  final TextEditingController voterIdController = TextEditingController();
  String? userId;

  LoginController(this._authRepository);

  Future<void> sendOtp(BuildContext context) async {
    final loginRes = await _authRepository.sendOtp(voterIdController.text);
    AnalyticsHelper().logEvent('send_otp_user', {
      'user_send_otp': true,
      "voter_id": voterIdController.text.toString(),
    });
    otpController.text = loginRes?.otp?.toString() ?? "";
    userId = loginRes?.userId ?? "";
    if (context.mounted && loginRes?.errorString == null) {
      Navigator.pushNamed(context, RouteName.otpScreen);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(loginRes?.errorString ?? '')));
    }
  }

  Future<void> verifyOtp(BuildContext context) async {
    final otpVerified = await _authRepository.verifyOtp(
        userId: userId, otp: int.parse(otpController.text.toString()));
    if (otpVerified) {
      Navigator.pushNamed(context, RouteName.voteScreen);
      AnalyticsHelper().logEvent('verify_otp_success', {
        'user_login_sucess': true,
        "voter_id": voterIdController.text.toString(),
      });
    } else {
      AnalyticsHelper().logEvent('verify_otp_error', {
        'user_login_sucess': false,
        "voter_id": voterIdController.text.toString(),
        "otp": otpController.text.toString(),
        "user_error_otp": true
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Wrong OTP")));
    }
  }
}
