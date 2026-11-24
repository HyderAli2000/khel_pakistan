import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/view/auth/create_profile.dart';
import 'package:khel_pakistan/view/home/navbar_user.dart';
import 'package:khel_pakistan/widgets/app_background.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class AllowLocationAccessScreen extends StatelessWidget {
  const AllowLocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              StepHeader(
                current: 3,
                total: 3,
                caption: 'Almost done · Location',
                onBack: () => Get.back(),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const _LocationBadge(),
                      24.verticalSpace,
                      Text(
                        'Allow Location Access',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.h1.copyWith(
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      10.verticalSpace,
                      Text(
                        'To provide the best experience with grounds and players near you',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.body.copyWith(
                          fontSize: 13.sp,
                          height: 1.6,
                        ),
                      ),
                      60.verticalSpace,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                child: AppButton(
                  text: 'Continue',
                  // TODO: request the real location permission here.
                  onTap: () => Get.offAll(() => const NavbarUser()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Lime circle with a darker crescent on the right and a black pin.
class _LocationBadge extends StatelessWidget {
  const _LocationBadge();

  @override
  Widget build(BuildContext context) {
    final d = 112.r;
    return SizedBox(
      width: d + 8.r,
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
            child: Icon(
              Icons.location_on,
              size: 44.r,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
