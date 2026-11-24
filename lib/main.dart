import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_theme.dart';
import 'package:khel_pakistan/view/auth/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ScreenUtilInit wraps the whole app so the theme (which uses .sp/.r)
    // and every pushed route are sized against the 430×932 design.
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          transitionDuration: const Duration(milliseconds: 500),
          defaultTransition: Transition.cupertino,
          theme: AppTheme.light,
          themeMode: ThemeMode.light,
          home: MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.01)),
            child: const SafeArea(top: false, child: SplashScreen()),
          ),
        );
      },
    );
  }
}
