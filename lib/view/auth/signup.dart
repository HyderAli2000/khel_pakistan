import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/auth/otp_verification.dart';
import 'package:khel_pakistan/widgets/app_background.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';
import 'package:khel_pakistan/widgets/page_header.dart';

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
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              const PageHeader(title: 'Sign up', showClose: true),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      24.verticalSpace,
                      Image.asset(AssetsImages.logoKhail, width: 260.w),
                      44.verticalSpace,
                      AppTextField(
                        hintText: 'Enter Email Address',
                        controller: _emailController,
                        prefixIcon: AssetsIcons.email,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                      ),
                      14.verticalSpace,
                      AppTextField(
                        hintText: 'Enter Password',
                        controller: _passwordController,
                        prefixIcon: AssetsIcons.lock,
                        suffixIcon: _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        obscureText: _obscurePassword,
                        textInputAction: TextInputAction.next,
                        onSuffixTap: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                      14.verticalSpace,
                      AppTextField(
                        hintText: 'Confirm Password',
                        controller: _confirmPasswordController,
                        prefixIcon: AssetsIcons.lock,
                        suffixIcon: _obscureConfirmPassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        obscureText: _obscureConfirmPassword,
                        onSuffixTap: () => setState(
                          () => _obscureConfirmPassword =
                              !_obscureConfirmPassword,
                        ),
                      ),
                      20.verticalSpace,
                      AppButton(
                        text: 'Sign Up',
                        onTap: () =>
                            Get.to(() => const OtpVerificationScreen()),
                      ),
                      22.verticalSpace,
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text.rich(
                          TextSpan(
                            text: 'Already have an account? ',
                            style: AppTextStyles.body.copyWith(fontSize: 13.sp),
                            children: [
                              TextSpan(
                                text: 'Sign In',
                                style: AppTextStyles.link.copyWith(
                                  fontSize: 13.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      24.verticalSpace,
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
}
