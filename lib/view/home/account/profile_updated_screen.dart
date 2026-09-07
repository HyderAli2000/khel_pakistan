import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class ProfileUpdatedScreen extends StatelessWidget {
  const ProfileUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.accessBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 88.w,
                    height: 88.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.green, width: 2.5),
                    ),
                    child: Icon(
                      Icons.check,
                      color: AppColors.green,
                      size: 42.sp,
                    ),
                  ),
                  28.verticalSpace,
                  Text(
                    'PROFILE UPDATED',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 36.sp,
                      fontFamily: AppFonts.rocket,
                      color: AppColors.green,
                    ),
                  ),
                  14.verticalSpace,
                  Text(
                    'Your Profile has been updated',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: AppFonts.satoshi,
                      fontWeight: FontWeight.w500,
                      color: AppColors.green.withValues(alpha: 0.85),
                    ),
                  ),
                  40.verticalSpace,
                  AppButton(
                    width: 220.w,
                    text: 'Continue',
                    gradientColors: const [AppColors.green],
                    textColor: AppColors.black,
                    onTap: () => Get.close(2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
