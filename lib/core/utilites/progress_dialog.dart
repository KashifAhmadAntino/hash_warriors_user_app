// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressDialog {
  static void openProgressDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                child: CircularProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: true,
    );
  }

  static void closeProgressDialog({
    VoidCallback? onDialogClosed,
  }) {
    Future.delayed(Duration.zero, () {
      log('drawer closed');
      final bool isOpen = Get.isDialogOpen ?? false;
      final context = Get.context;
      if (context != null) {
        if (isOpen) {
          Navigator.pop(context);
        }
        if (onDialogClosed != null) {
          onDialogClosed();
        }
      }
    });
  }
}
