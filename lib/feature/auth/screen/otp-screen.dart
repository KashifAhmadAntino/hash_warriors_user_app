import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_voting_app/core/reponsive/SizeConfig.dart';
import 'package:user_voting_app/core/routes/app_routes.dart';
import 'package:user_voting_app/core/universal_widgets/custom_pin_input_with_label.dart';
import 'package:user_voting_app/feature/auth/controller/login_controller.dart';

import '../../../core/image_loader.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _loginController = Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16 * SizeConfig.widthMultiplier!),
        child: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Verify OTP',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24 * SizeConfig.textMultiplier,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.30,
                  ),
                ),
                SizedBox(
                  height: 5 * SizeConfig.heightMultiplier!,
                ),
                Text(
                  'An OTP has been sent to your registered email ID',
                  style: TextStyle(
                    color: Color(0xFF7D7D7D),
                    fontSize: 14 * SizeConfig.textMultiplier,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.30,
                  ),
                ),
                SizedBox(
                  height: 30 * SizeConfig.heightMultiplier,
                ),
                CustomPinInputWithLabel(
                  pinController: _loginController.otpController,
                  length: 6,
                  isPinInputCenter: true,
                ),
                SizedBox(
                  height: 60 * SizeConfig.heightMultiplier,
                ),
                // Align(
                //   alignment: Alignment.centerRight,
                //   child: TextButton(
                //     onPressed: () {
                //       //forgot password screen
                //     },
                //     child: const Text(
                //       'Resend',
                //     ),
                //   ),
                // ),
                GestureDetector(
                  onTap: () {
                    _loginController.verifyOtp(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 56,
                    decoration: ShapeDecoration(
                      color: Color(0xFF128807),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: const Center(
                      child: Text(
                        'Verify',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
