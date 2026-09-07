import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';
import 'package:khel_pakistan/widgets/password_updated_sheet.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _existingController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _obscureExisting = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _existingController.dispose();
    _newController.dispose();
    _confirmController.dispose();
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
                        'CHANGE PASSWORD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
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
                  padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        controller: _existingController,
                        hintText: 'Existing Password',
                        prefixIcon: AssetsIcons.lock,
                        obscureText: _obscureExisting,
                        suffixIcon: _obscureExisting
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onSuffixTap: () => setState(
                          () => _obscureExisting = !_obscureExisting,
                        ),
                      ),
                      16.verticalSpace,
                      AppTextField(
                        controller: _newController,
                        hintText: 'New Password',
                        prefixIcon: AssetsIcons.lock,
                        obscureText: _obscureNew,
                        suffixIcon: _obscureNew
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onSuffixTap: () =>
                            setState(() => _obscureNew = !_obscureNew),
                      ),
                      8.verticalSpace,
                      Text(
                        'Must be at least 8 characters',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: AppFonts.satoshi,
                          color: AppColors.white.withValues(alpha: 0.45),
                        ),
                      ),
                      16.verticalSpace,
                      AppTextField(
                        controller: _confirmController,
                        hintText: 'Confirm Password',
                        prefixIcon: AssetsIcons.lock,
                        obscureText: _obscureConfirm,
                        suffixIcon: _obscureConfirm
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        onSuffixTap: () => setState(
                          () => _obscureConfirm = !_obscureConfirm,
                        ),
                      ),
                      8.verticalSpace,
                      Text(
                        'Must be at least 8 characters',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: AppFonts.satoshi,
                          color: AppColors.white.withValues(alpha: 0.45),
                        ),
                      ),
                      22.verticalSpace,
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password must contain:',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: AppFonts.satoshi,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            10.verticalSpace,
                            const _RequirementBullet('At least 8 characters'),
                            6.verticalSpace,
                            const _RequirementBullet(
                              'Mix of letters and numbers',
                            ),
                            6.verticalSpace,
                            const _RequirementBullet(
                              'At least one special character',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 20.h),
                child: AppButton(
                  text: 'Save Password',
                  gradientColors: const [AppColors.green],
                  textColor: AppColors.black,
                  onTap: () => showPasswordUpdatedSheet(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RequirementBullet extends StatelessWidget {
  const _RequirementBullet(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '•  ',
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: AppFonts.satoshi,
            color: AppColors.white,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              fontFamily: AppFonts.satoshi,
              fontWeight: FontWeight.w500,
              color: AppColors.white,
            ),
          ),
        ),
      ],
    );
  }
}
