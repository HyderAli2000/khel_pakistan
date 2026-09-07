import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/account/profile_updated_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _fullNameController = TextEditingController(text: 'Alex Murphy');
  final _phoneController = TextEditingController(text: '+92 333 456 7890');
  final _cityController = TextEditingController(text: 'Karachi, Pakistan');

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }

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
                        'EDIT PROFILE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26.sp,
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
                  padding: EdgeInsets.fromLTRB(20.w, 36.h, 20.w, 20.h),
                  child: Column(
                    children: [
                      Container(
                        width: 140.w,
                        height: 140.w,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.green.withValues(alpha: 0.55),
                            width: 3,
                          ),
                        ),
                        child: Center(
                          child: Image.asset(
                            AssetsIcons.cam,
                            width: 42.w,
                            height: 42.h,
                          ),
                        ),
                      ),
                      36.verticalSpace,
                      AppTextField(
                        controller: _fullNameController,
                        hintText: 'Full Name',
                      ),
                      14.verticalSpace,
                      AppTextField(
                        controller: _phoneController,
                        hintText: 'Phone Number',
                        keyboardType: TextInputType.phone,
                      ),
                      14.verticalSpace,
                      AppTextField(
                        controller: _cityController,
                        hintText: 'City',
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                child: AppButton(
                  text: 'Save',
                  gradientColors: const [AppColors.green],
                  textColor: AppColors.black,
                  onTap: () => Get.to(() => const ProfileUpdatedScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
