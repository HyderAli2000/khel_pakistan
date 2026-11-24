import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

/// Lime "Enjoy Your Weekend!" offer card with rackets spilling over the
/// top-left edge. Pass [onClose] to show the small × button.
class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key, this.onClose, this.onBook});

  final VoidCallback? onClose;
  final VoidCallback? onBook;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104.h,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            top: 14.h,
            child: Container(
              padding: EdgeInsets.fromLTRB(128.w, 0, 14.w, 0),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 14,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Enjoy Your\nWeekend!',
                          style: AppTextStyles.title.copyWith(
                            fontWeight: FontWeight.w600,
                            height: 1.15,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Upto 25% off',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppButton(
                    text: 'Book Now',
                    width: 96.w,
                    height: 38.h,
                    fontSize: 13.sp,
                    gradientColors: const [AppColors.dark],
                    onTap: onBook ?? () {},
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: -6.w,
            top: -10.h,
            child: IgnorePointer(
              child: Image.asset(AssetsImages.promoRackets, width: 128.w),
            ),
          ),
          if (onClose != null)
            Positioned(
              top: 20.h,
              right: 6.w,
              child: GestureDetector(
                onTap: onClose,
                child: Container(
                  width: 22.r,
                  height: 22.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.dark.withValues(alpha: 0.12),
                  ),
                  child: Icon(Icons.close_rounded, size: 14.r),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
