import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    otpController.text = loginRes?.otp?.toString() ?? "";
    userId = loginRes?.userId ?? "";
    if (context.mounted) Navigator.pushNamed(context, RouteName.otpScreen);
  }

  Future<void> verifyOtp(BuildContext context) async {
    final otpVerified = await _authRepository.verifyOtp(
        userId: userId, otp: voterIdController.text);
    if (otpVerified) {
      Navigator.pushNamed(context, RouteName.voteScreen);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Wrong OTP")));
    }
  }
}
