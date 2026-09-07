import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/fonts.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.gradientColors,
    this.textColor = AppColors.white,
    this.borderColor,
    this.icon,
    this.width,
    this.height,
    this.fontSize,
  });

  final String text;
  final VoidCallback onTap;

  /// Pass one color for a solid button or two+ colors for a gradient.
  /// Defaults to the orange gradient.
  final List<Color>? gradientColors;

  final Color textColor;
  final Color? borderColor;

  /// Shown before the text, e.g. Icon(...) or Image.asset(...).
  final Widget? icon;

  final double? width;
  final double? height;
  final double? fontSize;

  static const List<Color> _defaultGradient = [
    Color(0xFFFF7A2E),
    AppColors.orange,
  ];

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ?? _defaultGradient;

    return Material(
      color: Colors.transparent,
      child: Ink(
        width: width ?? double.infinity,
        height: height ?? 50.h,
        decoration: BoxDecoration(
          gradient: colors.length > 1
              ? LinearGradient(
                  colors: colors,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )
              : null,
          color: colors.length == 1 ? colors.first : null,
          borderRadius: BorderRadius.circular(99999999.r),
          // border: Border.all(
          //   color: borderColor ?? const Color(0xFFFF9A5C),
          //   width: 1.5,
          // ),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(99999999.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[icon!, 8.horizontalSpace],
              Text(
                text,
                style: TextStyle(
                  fontSize: fontSize ?? 18.sp,
                  fontFamily: AppFonts.satoshi,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
