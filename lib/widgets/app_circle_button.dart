import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';

/// Round icon button: black circle with a white icon (back, close, bell…).
class AppCircleButton extends StatelessWidget {
  const AppCircleButton({
    super.key,
    required this.icon,
    this.onTap,
    this.size,
    this.background = AppColors.dark,
    this.iconColor = AppColors.onDark,
  });

  /// Back chevron. Defaults to `Get.back()`.
  const AppCircleButton.back({super.key, this.onTap, this.size})
    : icon = Icons.chevron_left_rounded,
      background = AppColors.dark,
      iconColor = AppColors.onDark;

  /// Close (×). Defaults to `Get.back()`.
  const AppCircleButton.close({super.key, this.onTap, this.size})
    : icon = Icons.close_rounded,
      background = AppColors.dark,
      iconColor = AppColors.onDark;

  final IconData icon;
  final VoidCallback? onTap;
  final double? size;
  final Color background;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final d = size ?? 40.r;
    return Material(
      color: background,
      shape: const CircleBorder(),
      elevation: 3,
      shadowColor: Colors.black26,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap ?? () => Get.back(),
        child: SizedBox(
          width: d,
          height: d,
          child: Icon(icon, color: iconColor, size: d * 0.55),
        ),
      ),
    );
  }
}
