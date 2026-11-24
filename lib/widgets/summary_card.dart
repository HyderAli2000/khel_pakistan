import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';

/// Ticket-style summary: photo + title, detail rows, dashed tear line and a
/// lime total. Used for booking and tournament summaries/confirmations.
class SummaryCard extends StatelessWidget {
  const SummaryCard({
    super.key,
    required this.title,
    required this.rows,
    this.image,
    this.subtitle,
    this.total,
  });

  final String title;
  final String? subtitle;
  final String? image;

  /// (label, value) pairs.
  final List<(String, String)> rows;

  /// Shown in the lime footer when set, e.g. "Rs. 4,100".
  final String? total;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.divider),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(14.r),
            child: Row(
              children: [
                if (image != null) ...[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset(
                      image!,
                      width: 64.r,
                      height: 64.r,
                      fit: BoxFit.cover,
                    ),
                  ),
                  12.horizontalSpace,
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: AppTextStyles.subtitle),
                      if (subtitle != null) ...[
                        4.verticalSpace,
                        Text(subtitle!, style: AppTextStyles.caption),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          const _DashedDivider(),
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 12.h),
            child: Column(
              children: [
                for (final (label, value) in rows)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            label,
                            style: AppTextStyles.bodySecondary,
                          ),
                        ),
                        Text(
                          value,
                          style: AppTextStyles.bodyMedium.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          if (total != null)
            Container(
              color: AppColors.primary,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Total',
                      style: AppTextStyles.subtitle.copyWith(
                        color: AppColors.onPrimary,
                      ),
                    ),
                  ),
                  Text(
                    total!,
                    style: AppTextStyles.h2.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _DashedDivider extends StatelessWidget {
  const _DashedDivider();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: LayoutBuilder(
        builder: (_, c) {
          final count = (c.maxWidth / 10).floor();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              count,
              (_) => Container(width: 5, height: 1.2, color: AppColors.border),
            ),
          );
        },
      ),
    );
  }
}
