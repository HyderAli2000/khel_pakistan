import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/models/venue.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/view/home/bookings/bookings_detail_screen.dart';

/// Venue photo with a heart button, then name, rating, location and price.
/// Used on Home (horizontal lists) and Saved (full width).
class VenueCard extends StatelessWidget {
  const VenueCard({
    super.key,
    required this.venue,
    this.width,
    this.imageHeight,
    this.saved = false,
  });

  final Venue venue;

  /// Null = fill the available width.
  final double? width;
  final double? imageHeight;

  /// Filled heart when the venue is in the user's saved list.
  final bool saved;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => BookingsDetailScreen(
          image: venue.image,
          title: venue.name,
          location: venue.location,
        ),
      ),
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(14.r),
                  child: Image.asset(
                    venue.image,
                    width: double.infinity,
                    height: imageHeight ?? 150.h,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 10.r,
                  right: 10.r,
                  child: Container(
                    width: 32.r,
                    height: 32.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.dark.withValues(alpha: 0.55),
                    ),
                    child: Icon(
                      saved
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      size: 17.r,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                if (venue.promo != null)
                  Positioned(
                    left: 10.r,
                    bottom: 10.r,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 5.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(999),
                      ),
                      child: Text(
                        venue.promo!,
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.onPrimary,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            10.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Text(
                    venue.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.subtitle.copyWith(fontSize: 15.sp),
                  ),
                ),
                Icon(Icons.star_rounded, size: 16.r, color: AppColors.star),
                3.horizontalSpace,
                Text(venue.rating, style: AppTextStyles.bodyMedium),
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: Text(
                    venue.location,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.caption,
                  ),
                ),
                Text(
                  venue.price,
                  style: AppTextStyles.caption.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
