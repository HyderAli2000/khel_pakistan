import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/auth/signup.dart';
import 'package:khel_pakistan/view/home/navbar_user.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Login',
            style: TextStyle(
              fontSize: 40.sp,
              fontWeight: FontWeight.w400,
              fontFamily: AppFonts.rocket,
              color: AppColors.green,
            ),
          ),
          actions: [
            Container(
              width: 40.w,
              height: 40.h,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(100.r),
              ),
              padding: EdgeInsets.all(10.r),
              child: Image.asset(AssetsIcons.cancel),
            ),
          ],
          actionsPadding: EdgeInsets.only(right: 10.w),
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
                20.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 22.w,
                          height: 22.h,
                          child: Checkbox(
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() => _rememberMe = value ?? false);
                            },
                            activeColor: AppColors.green,
                            checkColor: Colors.black,
                            side: BorderSide(color: AppColors.green),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.r),
                            ),
                          ),
                        ),
                        8.horizontalSpace,
                        Text(
                          'Remember me',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.satoshi,
                            color: AppColors.white.withValues(alpha: 0.7),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.satoshi,
                        color: AppColors.white.withValues(alpha: 0.7),
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.white.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
                26.verticalSpace,
                AppButton(
                  text: 'Login',
                  gradientColors: const [AppColors.green],
                  textColor: Colors.black,
                  borderColor: AppColors.green,
                  onTap: () {
                    Get.offAll(() => NavbarUser());
                  },
                ),
                24.verticalSpace,
                GestureDetector(
                  onTap: () {
                    Get.to(() => SignupScreen());
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.satoshi,
                        color: AppColors.white,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.white,
                          ),
                        ),
                      ],
                    ),
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
                40.verticalSpace,
                Text(
                  'By signing up you agree to our',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: AppFonts.satoshi,
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
                4.verticalSpace,
                Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppFonts.satoshi,
                      color: AppColors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.white,
                        ),
                      ),
                      TextSpan(
                        text: ' & ',
                        style: TextStyle(
                          color: AppColors.white.withValues(alpha: 0.7),
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
