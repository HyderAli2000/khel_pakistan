import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/fonts.dart';

/// Named text styles for the new design (Inter).
///
/// These are getters because `.sp` needs ScreenUtil to be initialised.
/// Change color/weight at the call site with `.copyWith(...)`.
abstract final class AppTextStyles {
  static TextStyle _base(double size, FontWeight weight, {Color? color}) =>
      TextStyle(
        fontFamily: AppFonts.inter,
        fontSize: size.sp,
        fontWeight: weight,
        color: color ?? AppColors.textPrimary,
      );

  /// Big screen headings, e.g. "Welcome to Khel Pakistan!".
  static TextStyle get h1 => _base(24, FontWeight.w700);

  /// Screen titles in the app bar, e.g. "Login", "OTP Verification".
  static TextStyle get h2 => _base(20, FontWeight.w600);

  /// Section headings, e.g. "Upcoming Tournaments".
  static TextStyle get title => _base(18, FontWeight.w600);

  /// Card titles, list item names.
  static TextStyle get subtitle => _base(16, FontWeight.w600);

  static TextStyle get body => _base(14, FontWeight.w400);
  static TextStyle get bodyMedium => _base(14, FontWeight.w500);

  /// Secondary/supporting text.
  static TextStyle get bodySecondary =>
      _base(14, FontWeight.w400, color: AppColors.textSecondary);

  static TextStyle get caption =>
      _base(12, FontWeight.w400, color: AppColors.textSecondary);

  /// Text field input and hint.
  static TextStyle get input => _base(14, FontWeight.w400);
  static TextStyle get hint =>
      _base(14, FontWeight.w400, color: AppColors.textHint);

  /// Primary button label.
  static TextStyle get button =>
      _base(16, FontWeight.w600, color: AppColors.onPrimary);

  /// Underlined inline links, e.g. "Sign Up", "Resend".
  static TextStyle get link => _base(14, FontWeight.w600).copyWith(
    decoration: TextDecoration.underline,
    decorationColor: AppColors.textPrimary,
  );
}
