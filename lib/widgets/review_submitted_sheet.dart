import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/fonts.dart';

Future<void> showReviewSubmittedSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => const ReviewSubmittedSheet(),
  );
}

class ReviewSubmittedSheet extends StatelessWidget {
  const ReviewSubmittedSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(16.w, 0, 16.w, 24.h),
      padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 28.h),
      decoration: BoxDecoration(
        color: const Color(0xFF1B1C2D),
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.green.withValues(alpha: 0.55)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'REVIEW SUBMITTED',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26.sp,
              fontFamily: AppFonts.rocket,
              color: AppColors.green,
            ),
          ),
          14.verticalSpace,
          Text(
            'Thank you. Your rating & review has been submitted successfully.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppFonts.satoshi,
              height: 1.4,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}
