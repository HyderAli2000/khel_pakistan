import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/auth/otp_verification.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
            'Sign Up',
            style: TextStyle(
              fontSize: 40.sp,
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
                Image.asset(AssetsImages.logo, width: 250.w, height: 180.h),
                40.verticalSpace,
                AppTextField(
                  hintText: 'Enter Email Address',
                  controller: _emailController,
                  prefixIcon: AssetsIcons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                16.verticalSpace,
                AppTextField(
                  hintText: 'Enter Password',
                  controller: _passwordController,
                  prefixIcon: AssetsIcons.lock,
                  suffixIcon: _obscurePassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  obscureText: _obscurePassword,
                  onSuffixTap: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                ),
                24.verticalSpace,
                AppTextField(
                  hintText: 'Enter Confirm Password',
                  controller: _confirmPasswordController,
                  prefixIcon: AssetsIcons.lock,
                  suffixIcon: _obscureConfirmPassword
                      ? Icons.visibility_off
                      : Icons.visibility,
                  obscureText: _obscureConfirmPassword,
                  onSuffixTap: () {
                    setState(
                      () => _obscureConfirmPassword = !_obscureConfirmPassword,
                    );
                  },
                ),
                24.verticalSpace,
                AppButton(
                  text: 'Sign Up',
                  gradientColors: const [AppColors.green],
                  textColor: Colors.black,
                  borderColor: AppColors.green,
                  onTap: () {
                    Get.to(() => OtpVerificationScreen());
                  },
                ),
                24.verticalSpace,
                Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.satoshi,
                      color: AppColors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: AppColors.white.withValues(alpha: 0.3),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Or',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: AppColors.white.withValues(alpha: 0.3),
                      ),
                    ),
                  ],
                ),
                24.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: 'With Apple',
                        gradientColors: const [
                          Color.fromARGB(87, 0, 0, 0),
                          Colors.black,
                        ],
                        borderColor: Colors.black,
                        icon: Image.asset(
                          AssetsIcons.apple,
                          width: 22.w,
                          height: 22.h,
                        ),
                        onTap: () {},
                      ),
                    ),
                    16.horizontalSpace,
                    Expanded(
                      child: AppButton(
                        gradientColors: const [
                          Color(0xffFE6857),
                          Color(0xffFF3922),
                        ],
                        borderColor: Colors.red,
                        text: 'With Google',
                        icon: Image.asset(
                          AssetsIcons.google,
                          width: 22.w,
                          height: 22.h,
                        ),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
