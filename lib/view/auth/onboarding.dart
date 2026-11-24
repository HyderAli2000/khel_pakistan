import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/auth/login.dart';
import 'package:khel_pakistan/widgets/app_background.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              20.verticalSpace,
              Image.asset(AssetsImages.logoKhail, width: 160.w),
              Expanded(
                child: Image.asset(
                  AssetsImages.onboardingImg,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: Column(
                  children: [
                    Text(
                      'Play, Connect, Compete',
                      style: AppTextStyles.h1.copyWith(fontSize: 26.sp),
                      textAlign: TextAlign.center,
                    ),
                    12.verticalSpace,
                    Text(
                      'Book grounds, find players, and join tournaments across Pakistan all from one app built for every sports enthusiast.',
                      style: AppTextStyles.bodySecondary.copyWith(height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              28.verticalSpace,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: AppButton(
                  text: 'Get Started',
                  onTap: () => Get.offAll(() => const LoginScreen()),
                ),
              ),
              24.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
