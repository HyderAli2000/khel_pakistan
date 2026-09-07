import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/account/edit_profile_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.allBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 42.w,
                        height: 42.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withValues(alpha: 0.1),
                          border: Border.all(
                            color: AppColors.green.withValues(alpha: 0.45),
                          ),
                        ),
                        child: Image.asset(
                          AssetsIcons.back,
                          width: 16.w,
                          height: 16.h,
                          color: AppColors.green,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.green,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'PROFILE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontFamily: AppFonts.rocket,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 42.w),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.w,
                          vertical: 18.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF23243A),
                          borderRadius: BorderRadius.circular(16.r),
                          border: Border.all(
                            color: AppColors.white.withValues(alpha: 0.08),
                          ),
                        ),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Image.asset(
                                AssetsImages.p1,
                                width: 64.w,
                                height: 64.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            14.horizontalSpace,
                            Expanded(
                              child: Text(
                                'ALEX MURPHY,',
                                style: TextStyle(
                                  fontSize: 26.sp,
                                  fontFamily: AppFonts.rocket,
                                  color: AppColors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      28.verticalSpace,
                      const _ProfileField(
                        label: 'Email Address',
                        value: 'alex.murphy@domain.com',
                        verified: true,
                      ),
                      18.verticalSpace,
                      const _ProfileField(
                        label: 'Phone Number',
                        value: '+92 333 456 7890',
                        verified: true,
                      ),
                      18.verticalSpace,
                      const _ProfileField(
                        label: 'City',
                        value: 'Karachi, Pakistan',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                child: AppButton(
                  text: 'Edit Profile',
                  gradientColors: const [AppColors.green],
                  textColor: AppColors.black,
                  onTap: () => Get.to(() => const EditProfileScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.label,
    required this.value,
    this.verified = false,
  });

  final String label;
  final String value;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            fontFamily: AppFonts.satoshi,
            fontWeight: FontWeight.w500,
            color: AppColors.white.withValues(alpha: 0.55),
          ),
        ),
        8.verticalSpace,
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.18),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: AppFonts.satoshi,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
              if (verified)
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    'Verified',
                    style: TextStyle(
                      fontSize: 11.sp,
                      fontFamily: AppFonts.satoshi,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
