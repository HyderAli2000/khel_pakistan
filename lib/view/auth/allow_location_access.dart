import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';

class AllowLocationAccessScreen extends StatefulWidget {
  const AllowLocationAccessScreen({super.key});

  @override
  State<AllowLocationAccessScreen> createState() =>
      _AllowLocationAccessScreenState();
}

class _AllowLocationAccessScreenState extends State<AllowLocationAccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.accessBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 20.w),
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: AppColors.green,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(15.r),
                child: Image.asset(AssetsIcons.back),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 140.w,
                height: 140.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsIcons.accessCircle),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    AssetsIcons.loc,
                    width: 60.w,
                    height: 60.h,
                  ),
                ),
              ),
              30.verticalSpace,
              Text(
                'Allow Location Access',
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w400,
                  fontFamily: AppFonts.rocket,
                  color: AppColors.green,
                ),
              ),
              10.verticalSpace,
              SizedBox(
                width: 250.w,
                child: Text(
                  textAlign: TextAlign.center,
                  'To provide the best experience for your nearby Orthodontist',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    fontFamily: AppFonts.satoshi,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: AppButton(
            text: 'Continue',
            onTap: () {},
            gradientColors: const [AppColors.green],
            textColor: Colors.black,
            borderColor: AppColors.green,
          ),
        ),
      ),
    );
  }
}
