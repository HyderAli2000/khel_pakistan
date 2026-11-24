import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/review_submitted_sheet.dart';

class GiveReviewScreen extends StatefulWidget {
  const GiveReviewScreen({super.key, this.venueName = 'Karachi Sports Arena'});

  final String venueName;

  @override
  State<GiveReviewScreen> createState() => _GiveReviewScreenState();
}

class _GiveReviewScreenState extends State<GiveReviewScreen> {
  static const _labels = ['', 'Poor', 'Fair', 'Good', 'Very good', 'Excellent'];
  static const _quickTags = [
    'Clean court',
    'Good lighting',
    'Friendly staff',
    'Easy parking',
    'Value for money',
  ];

  int _rating = 0;
  final Set<String> _tags = {};
  final _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Give Review',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                AssetsImages.venue1,
                width: 120.r,
                height: 120.r,
                fit: BoxFit.cover,
              ),
            ),
          ),
          14.verticalSpace,
          Text(
            widget.venueName,
            textAlign: TextAlign.center,
            style: AppTextStyles.h2.copyWith(fontWeight: FontWeight.w600),
          ),
          4.verticalSpace,
          Text(
            'How would you rate this venue?',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySecondary,
          ),
          18.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 1; i <= 5; i++)
                GestureDetector(
                  onTap: () => setState(() => _rating = i),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 150),
                      scale: i <= _rating ? 1.1 : 1,
                      child: Icon(
                        i <= _rating
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        size: 44.r,
                        color: i <= _rating ? AppColors.star : AppColors.border,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          8.verticalSpace,
          SizedBox(
            height: 20.h,
            child: Text(
              _labels[_rating],
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyMedium.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          20.verticalSpace,
          const FieldLabel('What did you like?'),
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              for (final tag in _quickTags)
                GestureDetector(
                  onTap: () => setState(
                    () => _tags.contains(tag)
                        ? _tags.remove(tag)
                        : _tags.add(tag),
                  ),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: EdgeInsets.symmetric(
                      horizontal: 14.w,
                      vertical: 8.h,
                    ),
                    decoration: BoxDecoration(
                      color: _tags.contains(tag)
                          ? AppColors.primary
                          : AppColors.surface,
                      borderRadius: BorderRadius.circular(999),
                      border: Border.all(
                        color: _tags.contains(tag)
                            ? AppColors.dark
                            : AppColors.divider,
                      ),
                    ),
                    child: Text(
                      tag,
                      style: AppTextStyles.caption.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          20.verticalSpace,
          const FieldLabel('Your review'),
          TextField(
            controller: _reviewController,
            maxLines: 5,
            style: AppTextStyles.input,
            cursorColor: AppColors.textPrimary,
            decoration: InputDecoration(
              hintText: 'Tell other players about your experience…',
              hintStyle: AppTextStyles.hint,
              filled: true,
              fillColor: AppColors.surface,
              contentPadding: EdgeInsets.all(16.r),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: AppColors.divider),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
                borderSide: const BorderSide(color: AppColors.dark),
              ),
            ),
          ),
        ],
      ),
      bottom: AppButton(
        text: 'Submit Review',
        onTap: () async {
          await showReviewSubmittedSheet(context);
          if (mounted) Get.back();
        },
      ),
    );
  }
}
