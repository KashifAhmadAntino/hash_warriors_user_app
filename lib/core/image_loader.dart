import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:user_voting_app/core/reponsive/SizeConfig.dart';

///This is just an abstraction class of the [SvgPicture] library
///So that this library can be easily changed if needed
class ImageLoader {
  ImageLoader._();

  static Widget asset(
    String assetName, {
    double? height,
    double? width,
    Color? color,
    BoxFit? fit,
  }) {
    return Image.asset(assetName,
        height: height, width: width, color: color, fit: fit ?? BoxFit.contain);
  }

  static Widget assetSvg(
    String assetName, {
    double? height,
    double? width,
    Color? color,
    BoxFit? fit,
  }) {
    return SvgPicture.asset(
      assetName,
      height: height != null ? (height * SizeConfig.heightMultiplier!) : null,
      width: width != null ? (width * SizeConfig.widthMultiplier!) : null,
      color: color,
      fit: fit ?? BoxFit.contain,
    );
  }

  static Widget assetLottie(String assetName,
      {double? height,
      double? width,
      Color? color,
      BoxFit? fit,
      bool? repeat}) {
    return Lottie.asset(
      assetName,
      height: height,
      width: width,
      repeat: repeat,
      fit: fit ?? BoxFit.contain,
    );
  }

  static Widget networkSvg(
    String assetName, {
    double? height,
    double? width,
    Color? color,
  }) {
    return SvgPicture.network(
      assetName,
      height: height,
      width: width,
      color: color,
      fit: BoxFit.cover,
    );
  }
}
