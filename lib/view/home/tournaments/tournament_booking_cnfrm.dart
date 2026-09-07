import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/navbar_user.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class TournamentBookingCnfrmScreen extends StatelessWidget {
  const TournamentBookingCnfrmScreen({super.key});

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
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      width: 42.w,
                      height: 42.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.orange.withValues(alpha: 0.85),
                      ),
                      child: Image.asset(
                        AssetsIcons.back,
                        width: 16.w,
                        height: 16.h,
                        color: AppColors.white,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColors.white,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 72.w,
                        height: 72.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.green, width: 2),
                        ),
                        child: Icon(
                          Icons.check,
                          color: AppColors.green,
                          size: 36.sp,
                        ),
                      ),
                      24.verticalSpace,
                      Text(
                        'Registration Confirmed!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34.sp,
                          fontFamily: AppFonts.rocket,
                          color: AppColors.green,
                        ),
                      ),
                      20.verticalSpace,
                      Text(
                        'Your team has been registered for: Karachi Champions League 2026',
                        style: _detailStyle,
                      ),
                      8.verticalSpace,
                      Text('Registration ID: KP-T-20345', style: _detailStyle),
                      40.verticalSpace,
                      AppButton(
                        width: 300.w,
                        text: 'Continue',
                        gradientColors: const [AppColors.green],
                        textColor: AppColors.black,
                        onTap: () => Get.offAll(() => const NavbarUser()),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle get _detailStyle => TextStyle(
    fontSize: 15.sp,
    fontFamily: AppFonts.satoshi,
    fontWeight: FontWeight.w500,
    color: AppColors.white.withValues(alpha: 0.5),
  );
}
