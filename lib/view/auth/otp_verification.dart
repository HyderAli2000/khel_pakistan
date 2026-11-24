import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/auth/create_profile.dart';
import 'package:khel_pakistan/view/auth/login.dart';
import 'package:khel_pakistan/widgets/app_background.dart';
import 'package:khel_pakistan/widgets/page_header.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final CountDownController _controller = CountDownController();
  static const int _duration = 30;

  bool _canResend = false;
  bool _openedProfile = false;

  void _onOtpCompleted(String pin) {
    if (_openedProfile) return;
    _openedProfile = true;
    FocusScope.of(context).unfocus();
    Get.off(() => const CreateProfileScreen());
  }

  void _onResend() {
    if (!_canResend) return;
    setState(() => _canResend = false);
    _controller.restart(duration: _duration);
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
                title: 'OTP Verification',
                showBack: true,
                showClose: true,
                onClose: () => Get.offAll(() => const LoginScreen()),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Column(
                    children: [
                      24.verticalSpace,
                      Image.asset(AssetsImages.logoKhail, width: 260.w),
                      36.verticalSpace,
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.w),
                        child: Text(
                          'We have sent you an email containing 6 digits verification code. Please enter the code to verify your identity',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body.copyWith(
                            fontSize: 13.sp,
                            height: 1.6,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                      24.verticalSpace,
                      PinCodeTextField(
                        appContext: context,
                        length: 6,
                        keyboardType: TextInputType.number,
                        enableActiveFill: true,
                        animationType: AnimationType.fade,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        cursorColor: AppColors.textPrimary,
                        textStyle: AppTextStyles.subtitle.copyWith(
                          color: AppColors.textSecondary,
                        ),
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.circle,
                          fieldHeight: 48.r,
                          fieldWidth: 48.r,
                          borderWidth: 1,
                          inactiveBorderWidth: 1,
                          activeBorderWidth: 1,
                          selectedBorderWidth: 1.5,
                          inactiveFillColor: AppColors.inputFill,
                          activeFillColor: AppColors.inputFill,
                          selectedFillColor: AppColors.inputFill,
                          inactiveColor: AppColors.border,
                          activeColor: AppColors.border,
                          selectedColor: AppColors.dark,
                        ),
                        onCompleted: _onOtpCompleted,
                        onChanged: (_) {},
                      ),
                      48.verticalSpace,
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.12),
                              blurRadius: 24,
                              offset: const Offset(0, 10),
                            ),
                          ],
                        ),
                        child: CircularCountDownTimer(
                          duration: _duration,
                          initialDuration: 0,
                          controller: _controller,
                          width: 130.r,
                          height: 130.r,
                          ringColor: AppColors.primary,
                          fillColor: AppColors.dark,
                          backgroundColor: AppColors.primary,
                          strokeWidth: 4,
                          strokeCap: StrokeCap.round,
                          textStyle: AppTextStyles.title.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                          textFormat: CountdownTextFormat.MM_SS,
                          isReverse: true,
                          isReverseAnimation: true,
                          isTimerTextShown: true,
                          autoStart: true,
                          onComplete: () {
                            if (mounted) setState(() => _canResend = true);
                          },
                        ),
                      ),
                      40.verticalSpace,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: GestureDetector(
                  onTap: _onResend,
                  child: Text.rich(
                    TextSpan(
                      text: "Didn't Receive any code? ",
                      style: AppTextStyles.body.copyWith(fontSize: 13.sp),
                      children: [
                        TextSpan(
                          text: 'Resend',
                          style: AppTextStyles.link.copyWith(
                            fontSize: 13.sp,
                            color: _canResend
                                ? AppColors.textPrimary
                                : AppColors.textHint,
                            decorationColor: _canResend
                                ? AppColors.textPrimary
                                : AppColors.textHint,
                          ),
                        ),
                      ],
                    ),
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
