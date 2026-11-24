import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_theme.dart';
import 'package:khel_pakistan/widgets/page_header.dart';

/// Standard pushed screen: cream background, back button + centred title,
/// a body, and an optional pinned [bottom] area (usually a button).
class AppPage extends StatelessWidget {
  const AppPage({
    super.key,
    required this.title,
    required this.body,
    this.bottom,
    this.showBack = true,
    this.onBack,
    this.trailing,
  });

  final String title;
  final Widget body;
  final Widget? bottom;
  final bool showBack;
  final VoidCallback? onBack;

  /// Optional widget at the right of the header (e.g. a share button).
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemOverlay,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  PageHeader(title: title, showBack: showBack, onBack: onBack),
                  if (trailing != null)
                    Positioned(
                      right: 16.w,
                      top: 8.h,
                      bottom: 0,
                      child: Center(child: trailing),
                    ),
                ],
              ),
              Expanded(child: body),
              if (bottom != null)
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                  child: bottom,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Small grey label above a value or field, e.g. "Email Address".
class FieldLabel extends StatelessWidget {
  const FieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 6.h),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.label,
        ),
      ),
    );
  }
}
