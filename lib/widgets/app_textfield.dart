import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/fonts.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.obscureText = false,
    this.keyboardType,
  });

  final String hintText;
  final TextEditingController? controller;

  /// Asset path from [AssetsIcons], shown before the hint text.
  final String? prefixIcon;

  /// Asset path from [AssetsIcons], shown at the end (e.g. eye toggle).
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,

      style: TextStyle(
        fontSize: 16.sp,
        fontFamily: AppFonts.satoshi,
        color: AppColors.white,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontFamily: AppFonts.satoshi,
          color: AppColors.white.withValues(alpha: 0.7),
        ),
        filled: true,
        fillColor: AppColors.white.withValues(alpha: 0.08),
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        prefixIcon: prefixIcon != null
            ? Padding(
                padding: EdgeInsets.all(14.r),
                child: Image.asset(prefixIcon!, width: 22.w, height: 22.h),
              )
            : null,
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Padding(
                  padding: EdgeInsets.all(14.r),
                  child: Icon(suffixIcon, color: AppColors.white),
                ),
              )
            : null,
        enabledBorder: _border(AppColors.white.withValues(alpha: 0.3)),
        focusedBorder: _border(AppColors.green),
      ),
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(9999999.r),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}
