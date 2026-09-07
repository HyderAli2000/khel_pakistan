import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/auth/create_profile.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final CountDownController _controller = CountDownController();

  double _currentPercent = 0.0;
  Timer? _timer;
  // ignore: unused_field
  bool _showResendOption = false;
  bool complete = false;
  final int _duration = 30;
  bool _openedProfile = false;

  void startProgress() {
    _currentPercent = 0.0;
    _showResendOption = false;

    const totalDuration = 3;
    const updateInterval = 50;
    const totalSteps = (totalDuration * 60) ~/ updateInterval;

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(milliseconds: updateInterval), (
      timer,
    ) {
      if (!mounted) return;
      if (_currentPercent < 0.95) {
        setState(() {
          _currentPercent += 0.01 / totalSteps;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _showResendOption = true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startProgress();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _onOtpCompleted(String pin) {
    if (_openedProfile) return;
    _openedProfile = true;
    FocusScope.of(context).unfocus();

    // if (widget.isForgotPassword) {
    // TODO: Navigate to reset password screen.
    //   return;
    // }

    Get.off(() => CreateProfileScreen());
  }

  void _onResend() {
    setState(() {
      _controller.start();
      complete = false;
    });
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
            'OTP Verification',
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
                Image.asset(AssetsImages.logo, width: 250.w, height: 180.h),
                40.verticalSpace,
                Text(
                  textAlign: TextAlign.center,
                  'We have sent you an email containing 6 digits verification code. Please enter the code to verify your identity',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: AppFonts.satoshi,
                    height: 1.5,
                    color: AppColors.white.withValues(alpha: 0.7),
                  ),
                ),
                20.verticalSpace,
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    keyboardType: TextInputType.number,
                    enableActiveFill: true,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      fieldHeight: 52.h,
                      fieldWidth: 45.w,
                      borderWidth: 1,
                      inactiveBorderWidth: 1,
                      activeBorderWidth: 1,
                      selectedBorderWidth: 2,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: AppColors.white.withValues(alpha: 0.55),
                      activeFillColor: Colors.transparent,
                      activeColor: AppColors.green,
                      selectedFillColor: Colors.transparent,
                      selectedColor: AppColors.green,
                    ),
                    cursorColor: AppColors.green,
                    textStyle: TextStyle(
                      fontFamily: AppFonts.satoshi,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white,
                    ),
                    onCompleted: _onOtpCompleted,
                    onChanged: (_) {},
                  ),
                ),
                40.verticalSpace,
                Center(
                  child: SizedBox(
                    height: 150.h,
                    width: 150.w,
                    child: CircularCountDownTimer(
                      duration: _duration,
                      initialDuration: 0,
                      controller: _controller,
                      width: 124.w,
                      height: 124.h,
                      ringColor: Colors.transparent,
                      fillColor: AppColors.orange,
                      backgroundColor: AppColors.white,
                      strokeWidth: 6.0,
                      strokeCap: StrokeCap.round,
                      textStyle: TextStyle(
                        fontFamily: AppFonts.satoshi,
                        fontSize: 18.sp,
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      textFormat: CountdownTextFormat.MM_SS,
                      isReverse: true,
                      isReverseAnimation: true,
                      isTimerTextShown: true,
                      autoStart: true,
                      onComplete: () {
                        if (mounted) {
                          setState(() => complete = true);
                        }
                      },
                      onChange: (_) {},
                    ),
                  ),
                ),
                40.verticalSpace,
              ],
            ),
          ),
        ),
        bottomNavigationBar: complete
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _onResend,
                      child: Text.rich(
                        TextSpan(
                          style: TextStyle(
                            fontFamily: AppFonts.satoshi,
                            fontSize: 14.sp,
                            color: AppColors.white.withValues(alpha: 0.9),
                          ),
                          children: [
                            const TextSpan(text: "Didn't received the code?  "),
                            TextSpan(
                              text: 'Resend',
                              style: TextStyle(
                                fontFamily: AppFonts.satoshi,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : SizedBox.shrink(),
      ),
    );
  }
}
