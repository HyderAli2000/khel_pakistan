import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/auth/splash.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      transitionDuration: const Duration(milliseconds: 500),
      defaultTransition: Transition.cupertino,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: '${AppFonts.satoshi}, ${AppFonts.rocket}',
        bottomSheetTheme: const BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent,
          modalBarrierColor: Colors.transparent,
          modalElevation: 0,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
        ),
        appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
        useMaterial3: true,
      ),
      home: ScreenUtilInit(
        designSize: const Size(430, 932),
        useInheritedMediaQuery: true,
        builder: (context, child) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: const TextScaler.linear(1.01)),
                child: const SafeArea(
                  top: false,
                  bottom: true,
                  left: true,
                  right: true,
                  child: SplashScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
