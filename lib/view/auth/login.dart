import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/auth/signup.dart';
import 'package:khel_pakistan/view/home/navbar_user.dart';
import 'package:khel_pakistan/widgets/app_background.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';
import 'package:khel_pakistan/widgets/page_header.dart';

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
    return AppBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              PageHeader(
                title: 'Login',
                showClose: true,
                onClose: () {
                  if (Navigator.of(context).canPop()) Get.back();
                },
              ),
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
                        onSuffixTap: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                      12.verticalSpace,
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () =>
                                setState(() => _rememberMe = !_rememberMe),
                            child: Row(
                              children: [
                                _LimeCheckbox(value: _rememberMe),
                                8.horizontalSpace,
                                Text(
                                  'Remember me',
                                  style: AppTextStyles.caption.copyWith(
                                    color: AppColors.textHint,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              'Forgot Password?',
                              style: AppTextStyles.link.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      16.verticalSpace,
                      AppButton(
                        text: 'Login',
                        onTap: () => Get.offAll(() => const NavbarUser()),
                      ),
                      22.verticalSpace,
                      _AccountPrompt(
                        prompt: "Don't have an account? ",
                        action: 'Sign Up',
                        onTap: () => Get.to(() => const SignupScreen()),
                      ),
                      22.verticalSpace,
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            child: Text(
                              'Or',
                              style: AppTextStyles.title.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),
                      22.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              text: 'With Apple',
                              elevated: true,
                              fontSize: 14.sp,
                              gradientColors: const [
                                Color(0xFF3A3A3A),
                                Color(0xFF111111),
                              ],
                              icon: Image.asset(
                                AssetsIcons.apple,
                                height: 20.r,
                              ),
                              onTap: () {},
                            ),
                          ),
                          14.horizontalSpace,
                          Expanded(
                            child: AppButton(
                              text: 'With Google',
                              elevated: true,
                              fontSize: 14.sp,
                              gradientColors: const [
                                AppColors.dangerLight,
                                AppColors.danger,
                              ],
                              icon: Image.asset(
                                AssetsIcons.google,
                                height: 20.r,
                              ),
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      36.verticalSpace,
                      Text(
                        'By signing up you agree to our',
                        style: AppTextStyles.caption,
                      ),
                      6.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Terms & Conditions',
                            style: AppTextStyles.link.copyWith(fontSize: 12.sp),
                          ),
                          Text('  &  ', style: AppTextStyles.caption),
                          Text(
                            'Privacy Policy',
                            style: AppTextStyles.link.copyWith(fontSize: 12.sp),
                          ),
                        ],
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

class _LimeCheckbox extends StatelessWidget {
  const _LimeCheckbox({required this.value});

  final bool value;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18.r,
      height: 18.r,
      decoration: BoxDecoration(
        color: value ? AppColors.primary : AppColors.inputFill,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: value
          ? Icon(Icons.check, size: 14.r, color: AppColors.onPrimary)
          : null,
    );
  }
}

/// "Don't have an account? Sign Up" style line.
class _AccountPrompt extends StatelessWidget {
  const _AccountPrompt({
    required this.prompt,
    required this.action,
    required this.onTap,
  });

  final String prompt;
  final String action;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text.rich(
        TextSpan(
          text: prompt,
          style: AppTextStyles.body.copyWith(fontSize: 13.sp),
          children: [
            TextSpan(
              text: action,
              style: AppTextStyles.link.copyWith(fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}
