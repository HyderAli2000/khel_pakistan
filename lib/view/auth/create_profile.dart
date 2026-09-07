import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/view/auth/allow_location_access.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  final _fullNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _cityController = TextEditingController();

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneNumberController.dispose();
    _cityController.dispose();
    super.dispose();
  }

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
          title: Text(
            'Profile Creation',
            style: TextStyle(
              fontSize: 26.sp,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.rocket,
              color: AppColors.green,
            ),
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150.w,
                  height: 150.h,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.green.withValues(alpha: 0.6),
                      width: 4.r,
                    ),
                  ),
                  padding: EdgeInsets.all(10.r),
                  child: Center(
                    child: Image.asset(
                      AssetsIcons.cam,
                      width: 40.w,
                      height: 40.h,
                    ),
                  ),
                ),
                30.verticalSpace,
                AppTextField(
                  controller: _fullNameController,
                  hintText: 'Full Name',
                ),
                15.verticalSpace,
                AppTextField(
                  controller: _phoneNumberController,
                  hintText: 'Phone Number',
                ),
                15.verticalSpace,
                AppTextField(controller: _cityController, hintText: 'City'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: AppButton(
            text: 'Continue',
            onTap: () {
              Get.off(() => AllowLocationAccessScreen());
            },
            gradientColors: const [AppColors.green],
            textColor: Colors.black,
            borderColor: AppColors.green,
          ),
        ),
      ),
    );
  }
}
