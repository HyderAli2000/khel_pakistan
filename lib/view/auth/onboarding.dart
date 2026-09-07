import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/auth/login.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.authBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            40.verticalSpace,
            Image.asset(AssetsImages.logo, height: 120, width: 150),
            20.verticalSpace,
            Image.asset(AssetsImages.onboardingImg, width: double.infinity),
            20.verticalSpace,
            Text(
              'Play, Connect, Compete',
              style: TextStyle(
                fontSize: 35.sp,
                fontFamily: AppFonts.rocket,
                fontWeight: FontWeight.w400,
                color: AppColors.green,
              ),
              textAlign: TextAlign.center,
            ),
            20.verticalSpace,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Text(
                'Book grounds, find players, and join tournaments across Pakistan all from one app built for every sports enthusiast.',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontFamily: AppFonts.satoshi,
                  fontWeight: FontWeight.w400,
                  color: AppColors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            20.verticalSpace,
            AppButton(
              text: 'Get Started',
              onTap: () {
                Get.offAll(() => LoginScreen());
              },
              width: 230.w,
              height: 50.h,
              fontSize: 16.sp,
            ),
          ],
        ),
      ),
    );
  }
}
