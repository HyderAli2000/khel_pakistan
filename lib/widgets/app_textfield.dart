import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';

/// Grey pill text field from the new design, with an optional label above.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.label,
    this.prefixIcon,
    this.prefixIconData,
    this.suffixIcon,
    this.onSuffixTap,
    this.obscureText = false,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
  });

  final String hintText;
  final TextEditingController? controller;

  /// Small grey label shown above the field, e.g. "Full Name *".
  final String? label;

  /// Asset path from [AssetsIcons] for the leading icon (tinted dark).
  final String? prefixIcon;

  /// Material icon for the leading icon; used when [prefixIcon] is null.
  final IconData? prefixIconData;

  /// Trailing icon, e.g. the password eye toggle.
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  final bool obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    Widget? prefix;
    if (prefixIcon != null) {
      prefix = Padding(
        padding: EdgeInsets.all(15.r),
        child: Image.asset(
          prefixIcon!,
          width: 18.r,
          height: 18.r,
          color: AppColors.textPrimary,
        ),
      );
    } else if (prefixIconData != null) {
      prefix = Icon(prefixIconData, color: AppColors.textPrimary, size: 20.r);
    }

    final field = TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      inputFormatters: inputFormatters,
      cursorColor: AppColors.textPrimary,
      style: AppTextStyles.input,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyles.hint,
        filled: true,
        fillColor: AppColors.inputFill,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        prefixIcon: prefix,
        prefixIconConstraints: BoxConstraints(minWidth: 48.w),
        suffixIcon: suffixIcon != null
            ? GestureDetector(
                onTap: onSuffixTap,
                child: Icon(
                  suffixIcon,
                  color: AppColors.textPrimary.withValues(alpha: 0.7),
                  size: 20.r,
                ),
              )
            : null,
        enabledBorder: _border(AppColors.border),
        focusedBorder: _border(AppColors.dark),
      ),
    );

    if (label == null) return field;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label!,
          style: AppTextStyles.caption.copyWith(color: AppColors.label),
        ),
        6.verticalSpace,
        field,
      ],
    );
  }

  OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(999),
      borderSide: BorderSide(color: color, width: 1),
    );
  }
}
