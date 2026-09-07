import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/fonts.dart';

Future<void> showPasswordUpdatedSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    barrierColor: AppColors.black.withValues(alpha: 0.55),
    builder: (context) => const PasswordUpdatedSheet(),
  );
}

class PasswordUpdatedSheet extends StatelessWidget {
  const PasswordUpdatedSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 18.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1C2D),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.green.withValues(alpha: 0.55)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.green, width: 1.6),
            ),
            child: Icon(
              Icons.check,
              color: AppColors.green,
              size: 20.sp,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PASSWORD UPDATED',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontFamily: AppFonts.rocket,
                    color: AppColors.green,
                  ),
                ),
                6.verticalSpace,
                Text(
                  'Your password has been updated successfully',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontFamily: AppFonts.satoshi,
                    height: 1.35,
                    color: AppColors.green.withValues(alpha: 0.9),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
