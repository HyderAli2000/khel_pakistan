import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/auth/onboarding.dart';
import 'package:khel_pakistan/widgets/app_background.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      // off (not to) so Back from onboarding doesn't return to the splash.
      Get.off(() => const Onboarding());
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBackground(
      gradient: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: Image.asset(AssetsImages.logoKhail, width: 320.w)),
      ),
    );
  }
}
