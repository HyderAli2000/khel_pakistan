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
    this.textColor,
    this.borderColor,
    this.icon,
    this.width,
    this.height,
    this.fontSize,
    this.elevated = false,
  });

  final String text;
  final VoidCallback onTap;

  /// One color for a solid button, two or more for a gradient.
  /// Defaults to the lime gradient.
  final List<Color>? gradientColors;

  /// Defaults to dark on the default lime, white on custom colors.
  final Color? textColor;

  /// Kept for older call sites; the new design has no button borders.
  final Color? borderColor;

  /// Shown before the text, e.g. Icon(...) or Image.asset(...).
  final Widget? icon;

  final double? width;
  final double? height;
  final double? fontSize;

  /// Soft drop shadow (Apple / Google buttons in the design).
  final bool elevated;

  static const List<Color> primaryGradient = [
    AppColors.primary,
    AppColors.primaryDark,
  ];

  @override
  Widget build(BuildContext context) {
    final colors = gradientColors ?? primaryGradient;
    final fg =
        textColor ??
        (gradientColors == null ? AppColors.onPrimary : AppColors.white);

    return Container(
      width: width ?? double.infinity,
      height: height ?? 50.h,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(999),
        boxShadow: elevated
            ? [
                BoxShadow(
                  color: colors.last.withValues(alpha: 0.35),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ]
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        child: Ink(
          decoration: BoxDecoration(
            gradient: colors.length > 1
                ? LinearGradient(
                    colors: colors,
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )
                : null,
            color: colors.length == 1 ? colors.first : null,
            borderRadius: BorderRadius.circular(999),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(999),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) ...[icon!, 8.horizontalSpace],
                Flexible(
                  child: Text(
                    text,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: fontSize ?? 16.sp,
                      fontFamily: AppFonts.inter,
                      fontWeight: FontWeight.w600,
                      color: fg,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
