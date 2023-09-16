import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:user_voting_app/core/constants/app_colors.dart';
import 'package:user_voting_app/core/reponsive/SizeConfig.dart';

abstract class AppTextStyle {
  static TextStyle blackBold40 = GoogleFonts.montserrat(
    fontSize: 40 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.bold,
  );

  static TextStyle greyMedium14 = GoogleFonts.montserrat(
    fontSize: 14 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w500,
    color: Colors.grey.shade700,
  );

  static TextStyle whiteMedium16 = GoogleFonts.montserrat(
    fontSize: 16 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  static TextStyle primaryMedium15 = GoogleFonts.montserrat(
    fontSize: 15 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w500,
    color: Colors.blue,
  );

  static TextStyle font12w500 = TextStyle(
      fontSize: 12 * SizeConfig.textMultiplier, fontWeight: FontWeight.w500);

  static TextStyle font22w700 = TextStyle(
    fontSize: 22 * SizeConfig.textMultiplier,
    fontWeight: FontWeight.w700,
    fontFamily: 'Plus Jakarta Sans',
  );
  static TextStyle font24w700 = TextStyle(
    fontSize: 24 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    fontFamily: 'Plus Jakarta Sans',
  );

  static TextStyle font11w700JakartaChineseBlack = TextStyle(
    fontSize: 11 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w700,
    color: AppColors.chineseBlack,
    fontFamily: 'Plus Jakarta Sans',
  );
  static TextStyle font11w400JakartaChineseBlack53 = TextStyle(
    fontSize: 11 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.chineseBlack.withOpacity(0.53),
    fontFamily: 'Plus Jakarta Sans',
  );
  static TextStyle font14w500Jakarta = TextStyle(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    fontFamily: 'Plus Jakarta Sans',
  );
  static TextStyle font14w500Inter = TextStyle(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    fontFamily: 'Plus Jakarta Sans',
  );
  static TextStyle font14w400Inter = TextStyle(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    fontFamily: 'Plus Jakarta Sans',
  );

  static TextStyle font16w600Jakarta = TextStyle(
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w600,
    fontFamily: 'Plus Jakarta Sans',
  );

  static TextStyle f14w500JakartaBlackShade2 = TextStyle(
    color: AppColors.blackShade2,
    fontSize: 14 * SizeConfig.widthMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f14w600JakartaBlackShade2 = TextStyle(
    color: AppColors.blackShade2,
    fontSize: 14 * SizeConfig.widthMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w600,
  );
  static TextStyle f18w600JakartaRaisinBlack = TextStyle(
    color: AppColors.raisinBlack,
    fontSize: 18 * SizeConfig.widthMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w600,
  );
  static TextStyle f16w500InterNetural08 = TextStyle(
    color: AppColors.neutral08,
    fontSize: 16 * SizeConfig.widthMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f14w500InterNetural08 = TextStyle(
    color: AppColors.neutral08,
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f16w500InterNeutral08 = TextStyle(
    color: AppColors.neutral08,
    fontSize: 16 * SizeConfig.textMultiplier!,
    height: 1,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f18w600JakartaWhite = TextStyle(
    color: Colors.white,
    fontSize: 18 * SizeConfig.widthMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w600,
  );
  static TextStyle f14w500InterRed = TextStyle(
    color: AppColors.redError,
    fontSize: 14 * SizeConfig.widthMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f16w500InterBlackShade2 = TextStyle(
    color: AppColors.blackShade2,
    fontSize: 16 * SizeConfig.widthMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f16w500JakartaChineseBlack = TextStyle(
    color: AppColors.chineseBlack,
    fontSize: 16 * SizeConfig.widthMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f16w600InterBlackShade2 = TextStyle(
    color: AppColors.blackShade2,
    fontSize: 16 * SizeConfig.widthMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w600,
  );

  static TextStyle f16w600InterNewBlackShade2 = TextStyle(
    color: AppColors.blackShade2,
    fontSize: 16 * SizeConfig.widthMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static TextStyle f14w500InterNeutral06 = TextStyle(
    color: AppColors.neutral06,
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f14w500JakartaNeutral06 = TextStyle(
    color: AppColors.neutral06,
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f10w500InterBlackShade2 = TextStyle(
    color: AppColors.blackShade2,
    fontSize: 10 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f16w500InterNetural06 = TextStyle(
    color: AppColors.neutral06,
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f174w500InterChineseBlack = TextStyle(
    color: AppColors.chineseBlack.withOpacity(0.3),
    fontSize: 17.4 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f18w400Jakartaneutral02 = TextStyle(
    color: AppColors.neutral02,
    fontSize: 18 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w400,
  );
  static TextStyle f14w600InterBlackShade2 = TextStyle(
    color: AppColors.blackShade2,
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle f18w500RooberBlackShade2 = TextStyle(
    color: AppColors.blackShade2,
    fontSize: 18 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );
  static TextStyle f14w400InterBaseBg = TextStyle(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.baseBg,
    fontFamily: 'Inter',
  );
  static TextStyle f14w400InterNeural5 = TextStyle(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.neutral05,
    fontFamily: 'Inter',
  );
  static TextStyle f36w800JakartaBaseBg = TextStyle(
    fontSize: 36 * SizeConfig.textMultiplier!,
    color: AppColors.baseBg,
    fontWeight: FontWeight.w800,
    fontFamily: 'Plus Jakarta Sans',
  );
  static TextStyle f37w800JakartaBaseBg = TextStyle(
    fontSize: 36 * SizeConfig.textMultiplier!,
    color: AppColors.baseBg,
    fontWeight: FontWeight.w800,
    height: 1,
    fontFamily: 'Plus Jakarta Sans',
  );
  static TextStyle f14w400InterPrimaryShade900 = TextStyle(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryShade900,
    fontFamily: 'Inter',
  );
  static TextStyle f14w500InterPrimaryRaisinBlack = TextStyle(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w500,
    color: AppColors.raisinBlack,
    fontFamily: 'Inter',
  );
  static TextStyle f12w400JakartaPrimaryShade900Opacity30 = TextStyle(
    color: AppColors.chineseBlack.withOpacity(0.3),
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w600,
  );
  static TextStyle f16w600InterAccent03 = TextStyle(
    color: AppColors.accent03,
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle f16w600InterErrorRed02 = TextStyle(
    color: AppColors.redError02,
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle f9w400InterChineseBlackOpacity53 = TextStyle(
    color: AppColors.chineseBlack.withOpacity(0.53),
    fontSize: 9 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle f14w400InterChineseBlackOpacity53 = TextStyle(
    color: AppColors.chineseBlack.withOpacity(0.53),
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static TextStyle f12w400InterChineseBlackOpacity53 = TextStyle(
    color: AppColors.chineseBlack.withOpacity(0.53),
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static TextStyle f12w400InterNeutral07 = TextStyle(
    color: AppColors.neutral07,
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );
  static TextStyle f20w700InterChineseBlack = TextStyle(
    color: AppColors.chineseBlack,
    fontSize: 20 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static TextStyle f14w400InterNeutral05 = TextStyle(
    color: AppColors.neutral05,
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle f8w500InterWhite = TextStyle(
    color: AppColors.pureWhite,
    fontSize: 8 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f14w700InterChineseBlack = TextStyle(
    color: AppColors.chineseBlack,
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static TextStyle f14w700InterChineseBlackOpacity30 = TextStyle(
    color: AppColors.chineseBlack.withOpacity(0.3),
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w700,
  );

  static TextStyle f16w500InterNetural01 = TextStyle(
    color: AppColors.neutral01,
    fontSize: 16 * SizeConfig.widthMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f12w400Interneutral05 = TextStyle(
    color: AppColors.neutral05,
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle f12w400Interneutral06 = TextStyle(
    color: AppColors.neutral06,
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle f14w400InterChineseBlackOpacity23 = TextStyle(
    color: AppColors.chineseBlack.withOpacity(0.23),
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle f14w400InterChineseBlack = TextStyle(
    color: AppColors.chineseBlack,
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w400,
  );

  static TextStyle f14w500InterChineseBlack = TextStyle(
    color: AppColors.chineseBlack,
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f14w500InterChineseBlackOpacity53 = TextStyle(
    color: AppColors.chineseBlack.withOpacity(0.53),
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f12w500JakartaPrimaryShade900Opacity53 = TextStyle(
    color: AppColors.chineseBlack.withOpacity(0.53),
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f12w500JakartaChineseBlack = TextStyle(
    color: AppColors.chineseBlack,
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f12w500JakartaNeutral03 = TextStyle(
    color: AppColors.neutral03,
    fontSize: 12 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f20w700RooberWhite = TextStyle(
    color: AppColors.pureWhite,
    fontSize: 20 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle f20w700RooberChineseBlack = TextStyle(
    color: AppColors.chineseBlack,
    fontSize: 20 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle f14w400InterWhite = TextStyle(
    fontSize: 14 * SizeConfig.textMultiplier!,
    fontWeight: FontWeight.w400,
    color: AppColors.pureWhite,
    fontFamily: 'Inter',
  );

  static TextStyle f17w500InterWhite = TextStyle(
    color: AppColors.pureWhite,
    fontSize: 17.4 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f16w700JakartaChineseBlack = TextStyle(
    color: AppColors.chineseBlack,
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontFamily: 'Plus Jakarta Sans',
    fontWeight: FontWeight.w700,
  );

  static TextStyle f18w500InterNetural01 = TextStyle(
    color: AppColors.neutral01,
    fontSize: 18 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );

  static TextStyle f16w600InterNetural06 = TextStyle(
    color: AppColors.neutral06,
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );

  static TextStyle f16w600InterPureWhite = TextStyle(
    color: AppColors.pureWhite,
    fontSize: 16 * SizeConfig.textMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w600,
  );
  static TextStyle f14w500InterBlack = TextStyle(
    color: AppColors.pureBlack,
    fontSize: 14 * SizeConfig.widthMultiplier!,
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
  );
}
