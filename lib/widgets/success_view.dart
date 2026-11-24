import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/widgets/app_background.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

/// Lime circle with a darker crescent and a check mark (matches the
/// location-access badge from the design).
class SuccessBadge extends StatelessWidget {
  const SuccessBadge({super.key, this.size, this.icon = Icons.check_rounded});

  final double? size;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final d = size ?? 104.r;
    return SizedBox(
      width: d + d * 0.07,
      height: d,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              width: d,
              height: d,
              decoration: const BoxDecoration(
                color: AppColors.primaryDark,
                shape: BoxShape.circle,
              ),
            ),
          ),
          Container(
            width: d,
            height: d,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: d * 0.45, color: AppColors.onPrimary),
          ),
        ],
      ),
    );
  }
}

/// Full-screen confirmation: badge, title, message, optional [details]
/// (e.g. a booking summary card) and one or two buttons.
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.title,
    required this.message,
    required this.primaryText,
    required this.onPrimary,
    this.secondaryText,
    this.onSecondary,
    this.details,
  });

  final String title;
  final String message;
  final Widget? details;
  final String primaryText;
  final VoidCallback onPrimary;
  final String? secondaryText;
  final VoidCallback? onSecondary;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // A confirmation should be left through its buttons, not Back.
      canPop: false,
      child: AppBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.fromLTRB(24.w, 60.h, 24.w, 20.h),
                    child: Column(
                      children: [
                        const SuccessBadge(),
                        28.verticalSpace,
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.h1.copyWith(fontSize: 22.sp),
                        ),
                        10.verticalSpace,
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body.copyWith(
                            fontSize: 13.sp,
                            height: 1.6,
                            color: AppColors.textSecondary,
                          ),
                        ),
                        if (details != null) ...[28.verticalSpace, details!],
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                  child: Column(
                    children: [
                      AppButton(text: primaryText, onTap: onPrimary),
                      if (secondaryText != null) ...[
                        12.verticalSpace,
                        AppButton(
                          text: secondaryText!,
                          gradientColors: const [AppColors.dark],
                          onTap: onSecondary ?? () {},
                        ),
                      ],
                    ],
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

/// Bottom sheet with a small success badge, title and message.
Future<void> showSuccessSheet(
  BuildContext context, {
  required String title,
  required String message,
}) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: AppColors.dark.withValues(alpha: 0.45),
    builder: (context) => SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
        padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 24.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SuccessBadge(size: 64.r),
            18.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w600),
            ),
            8.verticalSpace,
            Text(
              message,
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(
                fontSize: 13.sp,
                height: 1.5,
                color: AppColors.textSecondary,
              ),
            ),
            22.verticalSpace,
            AppButton(text: 'Done', onTap: () => Navigator.of(context).pop()),
          ],
        ),
      ),
    ),
  );
}
