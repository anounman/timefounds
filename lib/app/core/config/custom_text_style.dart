import 'package:flutter/widgets.dart';

import 'app_color.dart';

class CustomTextStyle {
  CustomTextStyle._();
  static const String fontFamily = 'SF Pro';

  /// fontsize 24 w900
  /// fontFamily SF Pro
  static const heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w900,
    fontFamily: fontFamily,
  );

  /// 13 normal
  static const regularText = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.normal,
    fontFamily: fontFamily,
  );

  /// fontsize 16 w900
  static const meunuItemTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    fontFamily: fontFamily,
    letterSpacing: 0.6,
  );

  /// 18 bold
  static const profileCardHello = TextStyle(
    fontSize: 18,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w900,
  );

  /// 13 w500
  static const profileCardEmail = TextStyle(
    fontSize: 13,
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
  );

  /// 14 w900
  static TextStyle logoutText = regularText.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w900,
    color: AppColor.logoutText,
  );

  /// 18 w600
  static TextStyle restPasswordText = regularText.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColor.restPasswordText,
  );

  /// 14 w600
  static TextStyle testButtonText = regularText.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.regularText,
  );

  /// 14 w900
  static TextStyle bottomNavBarText = regularText.copyWith(
    fontSize: 11,
    fontWeight: FontWeight.w900,
  );

  /// 18 w500
  static TextStyle inputHinitText = regularText.copyWith(
    fontSize: 18,
    color: AppColor.secondaryText,
    fontWeight: FontWeight.w500,
  );
}
