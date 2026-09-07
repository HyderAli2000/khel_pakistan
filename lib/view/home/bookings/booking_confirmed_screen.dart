import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/navbar_user.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class BookingConfirmedScreen extends StatelessWidget {
  const BookingConfirmedScreen({super.key});

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
                        'BOOKING CONFIRMED',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 34.sp,
                          fontFamily: AppFonts.rocket,
                          color: AppColors.green,
                        ),
                      ),
                      20.verticalSpace,
                      Text('Booking ID: KP-247891', style: _detailStyle),
                      8.verticalSpace,
                      Text('Venue: Karachi Sports Arena', style: _detailStyle),
                      8.verticalSpace,
                      Text('Date: Friday, 18 July', style: _detailStyle),
                      8.verticalSpace,
                      Text('Time: 7:00 PM – 9:00 PM', style: _detailStyle),
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
