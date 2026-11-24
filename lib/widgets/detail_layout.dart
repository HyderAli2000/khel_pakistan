import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_card.dart';
import 'package:khel_pakistan/widgets/app_circle_button.dart';

/// Detail page (venue, booking, tournament): a hero photo with round action
/// buttons, a cream sheet that scrolls up over it, and an optional pinned
/// [bottomBar].
class DetailScaffold extends StatelessWidget {
  const DetailScaffold({
    super.key,
    required this.image,
    required this.children,
    this.actions = const [],
    this.bottomBar,
    this.floatingActionButton,
  });

  final String image;
  final List<Widget> children;

  /// Round buttons at the top right of the photo (share, favourite…).
  final List<Widget> actions;
  final Widget? bottomBar;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final heroHeight = 300.h;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // Light icons over the photo.
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.background,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppColors.background,
        floatingActionButton: floatingActionButton,
        body: Stack(
          children: [
            Image.asset(
              image,
              height: heroHeight,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            // Darken the top so the status bar and buttons stay readable.
            Container(
              height: 120.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.45),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(top: heroHeight - 28.r),
              child: Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.sizeOf(context).height - heroHeight,
                ),
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(28.r),
                  ),
                ),
                padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 28.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                child: Row(
                  children: [
                    const AppCircleButton.back(),
                    const Spacer(),
                    for (final a in actions) ...[10.horizontalSpace, a],
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: bottomBar,
      ),
    );
  }
}

/// Round translucent-dark action button for the hero photo.
class HeroAction extends StatelessWidget {
  const HeroAction({super.key, required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AppCircleButton(
      icon: icon,
      onTap: onTap,
      background: AppColors.dark.withValues(alpha: 0.7),
      iconColor: AppColors.primary,
    );
  }
}

/// Centred title + subtitle at the top of a detail sheet.
class DetailTitle extends StatelessWidget {
  const DetailTitle({super.key, required this.title, this.subtitle});

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.h1.copyWith(fontSize: 22.sp),
          ),
          if (subtitle != null) ...[
            6.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 15.r,
                  color: AppColors.textSecondary,
                ),
                4.horizontalSpace,
                Flexible(
                  child: Text(subtitle!, style: AppTextStyles.bodySecondary),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

/// Section heading inside a detail sheet.
class DetailSection extends StatelessWidget {
  const DetailSection({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.title.copyWith(
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          12.verticalSpace,
          child,
        ],
      ),
    );
  }
}

/// "4.8 ★★★★★ | 452 Reviews" card.
class RatingSummary extends StatelessWidget {
  const RatingSummary({super.key, this.rating = '4.8', this.reviews = '452'});

  final String rating;
  final String reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h),
      child: AppCard(
        padding: EdgeInsets.symmetric(vertical: 14.h),
        child: IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(rating, style: AppTextStyles.h1),
                    4.verticalSpace,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        5,
                        (_) => Icon(
                          Icons.star_rounded,
                          size: 16.r,
                          color: AppColors.star,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const VerticalDivider(width: 1),
              Expanded(
                child: Column(
                  children: [
                    Text(reviews, style: AppTextStyles.h1),
                    4.verticalSpace,
                    Text('Reviews', style: AppTextStyles.caption),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Body text paragraph in a detail sheet.
class DetailParagraph extends StatelessWidget {
  const DetailParagraph(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 18.h),
      child: Text(
        text,
        style: AppTextStyles.bodySecondary.copyWith(
          fontSize: 13.sp,
          height: 1.6,
        ),
      ),
    );
  }
}

/// Lime pill chips, e.g. amenities.
class ChipWrap extends StatelessWidget {
  const ChipWrap({super.key, required this.items, this.icons = const {}});

  final List<String> items;
  final Map<String, IconData> icons;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: [
        for (final item in items)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(999),
              border: Border.all(color: AppColors.divider),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  icons[item] ?? Icons.check_circle_rounded,
                  size: 16.r,
                  color: AppColors.textPrimary,
                ),
                6.horizontalSpace,
                Text(
                  item,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

/// Default icons for common amenities.
const amenityIcons = {
  'Parking': Icons.local_parking_rounded,
  'Locker': Icons.lock_outline_rounded,
  'Cafe': Icons.local_cafe_outlined,
  'Washroom': Icons.wc_rounded,
  'Floodlights': Icons.light_mode_outlined,
};

/// Staggered 2×2 photo grid.
class GalleryGrid extends StatelessWidget {
  const GalleryGrid({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    String at(int i) => images[i % images.length];
    Widget tile(String path) => ClipRRect(
      borderRadius: BorderRadius.circular(14.r),
      child: Image.asset(
        path,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
    return SizedBox(
      height: 320.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                Expanded(flex: 3, child: tile(at(0))),
                8.verticalSpace,
                Expanded(flex: 2, child: tile(at(2))),
              ],
            ),
          ),
          8.horizontalSpace,
          Expanded(
            child: Column(
              children: [
                Expanded(flex: 2, child: tile(at(1))),
                8.verticalSpace,
                Expanded(flex: 3, child: tile(at(3))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Placeholder map with a pin, until a real map is added.
class MapPreview extends StatelessWidget {
  const MapPreview({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 16.r,
              color: AppColors.textSecondary,
            ),
            6.horizontalSpace,
            Expanded(child: Text(location, style: AppTextStyles.bodySecondary)),
          ],
        ),
        12.verticalSpace,
        ClipRRect(
          borderRadius: BorderRadius.circular(16.r),
          child: Container(
            height: 170.h,
            width: double.infinity,
            color: AppColors.card,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CustomPaint(painter: _MapGridPainter()),
                Center(
                  child: Container(
                    width: 48.r,
                    height: 48.r,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.dark, width: 2),
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: AppColors.onPrimary,
                      size: 26.r,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final grid = Paint()
      ..color = AppColors.border.withValues(alpha: 0.6)
      ..strokeWidth = 1;
    const step = 28.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), grid);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }
    final road = Paint()
      ..color = AppColors.surface
      ..strokeWidth = 8;
    canvas.drawLine(
      Offset(0, size.height * 0.35),
      Offset(size.width, size.height * 0.55),
      road,
    );
    canvas.drawLine(
      Offset(size.width * 0.3, 0),
      Offset(size.width * 0.55, size.height),
      road,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Pinned bottom bar: price on the left, action button on the right.
class PriceBar extends StatelessWidget {
  const PriceBar({
    super.key,
    required this.price,
    required this.caption,
    required this.buttonText,
    required this.onTap,
  });

  final String price;
  final String caption;
  final String buttonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 16,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 12.h),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    price,
                    style: AppTextStyles.h2.copyWith(fontSize: 20.sp),
                  ),
                  2.verticalSpace,
                  Text(caption, style: AppTextStyles.caption),
                ],
              ),
              20.horizontalSpace,
              Expanded(
                child: AppButton(text: buttonText, onTap: onTap),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Pinned bottom bar with a single full-width button.
class BottomActionBar extends StatelessWidget {
  const BottomActionBar({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 12.h),
        child: child,
      ),
    );
  }
}
