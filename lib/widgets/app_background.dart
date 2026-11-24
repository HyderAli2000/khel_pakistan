import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_theme.dart';
import 'package:khel_pakistan/utils/assets_images.dart';

/// Cream background with the faint Urdu-lettering watermark near the bottom.
/// Also sets dark status-bar icons. Put a transparent Scaffold inside.
class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
    this.gradient = false,
    this.showWatermark = true,
  });

  final Widget child;

  /// Splash-style lime → peach gradient instead of flat cream.
  final bool gradient;
  final bool showWatermark;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemOverlay,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.background,
          gradient: gradient
              ? const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [AppColors.splashTop, AppColors.splashBottom],
                )
              : null,
        ),
        child: Stack(
          children: [
            if (showWatermark)
              Positioned(
                left: -30.w,
                right: -30.w,
                bottom: 60.h,
                child: IgnorePointer(
                  // The export is black at ~5% opacity, so draw it as-is.
                  child: Image.asset(
                    AssetsImages.bgWatermark,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            Positioned.fill(child: child),
          ],
        ),
      ),
    );
  }
}
