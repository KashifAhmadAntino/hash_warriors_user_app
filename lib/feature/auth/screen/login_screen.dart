import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:user_voting_app/core/constants/app_text_style.dart';
import 'package:user_voting_app/core/universal_widgets/custom_pin_input_with_label.dart';
import 'package:user_voting_app/core/universal_widgets/custom_text_field_with_label.dart';

import '../../../core/reponsive/SizeConfig.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(10),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(fontSize: 24),
                      )),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: CustomTextFieldWithLabel(
                      controller: nameController,
                      title: 'Voter ID',
                      dynamicKeyboardText: 'GDN0453323',
                      hint: 'GDN0453323',
                    ),
                  ),
                  SizedBox(
                    height: 4.heightMultiplier,
                  ),
                  Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: CustomPinInputWithLabel(
                        pinController: TextEditingController(),
                        unfilledInputLabel: "OTP",
                        filledInputLabel: "OTP",
                        isPinInputCenter: true,
                        length: 4,
                      )),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        //forgot password screen
                      },
                      child: const Text(
                        'Resend',
                      ),
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Login'),
                        onPressed: () {
                          print(nameController.text);
                          print(passwordController.text);
                        },
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
