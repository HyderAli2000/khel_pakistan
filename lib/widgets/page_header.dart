import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/widgets/app_circle_button.dart';

/// Page top bar: optional back (left), centred title or
/// custom [center] widget, optional close (right).
class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
    this.title,
    this.center,
    this.onBack,
    this.onClose,
    this.showBack = false,
    this.showClose = false,
  });

  final String? title;
  final Widget? center;
  final bool showBack;
  final bool showClose;
  final VoidCallback? onBack;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: SizedBox(
        height: 52.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (center != null)
              center!
            else if (title != null)
              Text(
                title!,
                style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w500),
              ),
            if (showBack)
              Align(
                alignment: Alignment.centerLeft,
                child: AppCircleButton.back(onTap: onBack),
              ),
            if (showClose)
              Align(
                alignment: Alignment.centerRight,
                child: AppCircleButton.close(onTap: onClose),
              ),
          ],
        ),
      ),
    );
  }
}
