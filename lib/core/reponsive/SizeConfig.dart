import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: avoid_classes_with_only_static_members
class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  // static double _blockSizeHorizontal = 0;
  // static double _blockSizeVertical = 0;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  static void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (screenWidth < 450) {
        isMobilePortrait = true;
      }
    } else {
      screenWidth = constraints.maxHeight;
      // _screenHeight = constraints.maxWidth;s
      isPortrait = false;
      isMobilePortrait = false;
    }

    // _blockSizeHorizontal = _screenWidth / 100;
    // _blockSizeVertical = _screenHeight / 100;

    // textMultiplier = _blockSizeVertical / 6.4;
    // imageSizeMultiplier = _blockSizeHorizontal / 3.6;
    // heightMultiplier = _blockSizeVertical / 6.4;
    // widthMultiplier = _blockSizeHorizontal / 3.6;

    textMultiplier = 1.sp;
    imageSizeMultiplier = 1;
    heightMultiplier = 1.h;
    widthMultiplier = 1.w;
  }
}

extension SizeExtension on num {
  double get widthMultiplier => this * SizeConfig.widthMultiplier;
  double get heightMultiplier => this * SizeConfig.heightMultiplier;
  double get imageSizeMultiplier => this * SizeConfig.imageSizeMultiplier;
  double get textMultiplier => this * SizeConfig.textMultiplier;
}
