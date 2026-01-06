import 'package:brainbox_ai/Helpers/ResponsiveUI.dart';
import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryWhite = Color(0xffFFFFFF);
  static const Color secondaryWhite = Color(0xffFAFDFF);
  static const Color primaryBlack = Color(0xff000000);
  static const Color secondaryBlack = Color(0xff141718);
  static const Color blurWhite = Color(0xffD3D1D8);
  static const Color sendButtonBorder = Color(0xffE1E1E1);
  
  static const Color darkGrey = Color(0xff757474);
  static const Color lightGrey = Color(0xffF7F7F8);
  static const Color textGrey = Color(0xffA0A0A5);
}

class Styles {
  /// Base builder
  static TextStyle _base({
    required String fontFamily,
    required double fontSize,
    FontWeight? fontWeight,
    double? height,
    required Color color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
      height: height,
      color: color,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle get appBarTitle => _base(
    fontFamily: "PoppinsMedium",
    fontSize: 22,
    height: 23.lh(22),
    color: AppColors.secondaryBlack,
  );

  static TextStyle get appTitle => _base(
    fontFamily: "PoppinsSemiBold",
    fontSize: 38,
    color: AppColors.darkGrey,
  );

  static TextStyle get recommendationText => _base(
    fontFamily: "UrbanistMedium",
    fontSize: 14.49,
    letterSpacing: 0.18.w,
    color: AppColors.textGrey,
  );

  static TextStyle get sendButtonText => _base(
    fontFamily: "UrbanistRegular",
    fontSize: 16,
    letterSpacing: 0.15.w,
    color: AppColors.secondaryBlack,
  );

  static TextStyle get sendButtonHint => _base(
    fontFamily: "UrbanistRegular",
    fontSize: 16,
    letterSpacing: 0.15.w,
    height: 1.2,
    color: AppColors.textGrey,
  );
}
