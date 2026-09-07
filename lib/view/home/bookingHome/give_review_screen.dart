import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/review_submitted_sheet.dart';

class GiveReviewScreen extends StatefulWidget {
  const GiveReviewScreen({
    super.key,
    this.venueName = 'Karachi Sports Arena',
  });

  final String venueName;

  @override
  State<GiveReviewScreen> createState() => _GiveReviewScreenState();
}

class _GiveReviewScreenState extends State<GiveReviewScreen> {
  int _rating = 0;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.allBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 42.w,
                        height: 42.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withValues(alpha: 0.1),
                        ),
                        child: Image.asset(
                          AssetsIcons.back,
                          width: 16.w,
                          height: 16.h,
                          color: AppColors.white,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.white,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'GIVE REVIEW',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 28.sp,
                          fontFamily: AppFonts.rocket,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 42.w),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 20.h),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 28.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF23243A),
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(
                        color: AppColors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 64.w,
                          height: 64.w,
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                            color: AppColors.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.thumb_up_alt_rounded,
                            color: AppColors.white,
                            size: 30.sp,
                          ),
                        ),
                        20.verticalSpace,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(5, (index) {
                            final starIndex = index + 1;
                            final selected = starIndex <= _rating;
                            return GestureDetector(
                              onTap: () => setState(() => _rating = starIndex),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.w),
                                child: Icon(
                                  selected ? Icons.star : Icons.star_border,
                                  color: const Color(0xFFFFC107),
                                  size: 34.sp,
                                ),
                              ),
                            );
                          }),
                        ),
                        18.verticalSpace,
                        Text(
                          'RATE THIS VENUE',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontFamily: AppFonts.rocket,
                            color: AppColors.green,
                          ),
                        ),
                        8.verticalSpace,
                        Text(
                          'How would you rate this venue?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: AppFonts.satoshi,
                            color: AppColors.white.withValues(alpha: 0.55),
                          ),
                        ),
                        20.verticalSpace,
                        TextField(
                          controller: _reviewController,
                          maxLines: 5,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.satoshi,
                            color: AppColors.white,
                          ),
                          cursorColor: AppColors.green,
                          decoration: InputDecoration(
                            hintText: 'Write Review',
                            hintStyle: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.satoshi,
                              color: AppColors.white.withValues(alpha: 0.45),
                            ),
                            filled: true,
                            fillColor: const Color(0xFF1B1C2D),
                            contentPadding: EdgeInsets.all(16.r),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                              borderSide: BorderSide(
                                color: AppColors.white.withValues(alpha: 0.1),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.r),
                              borderSide: const BorderSide(
                                color: AppColors.green,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                child: AppButton(
                  text: 'Submit',
                  gradientColors: const [AppColors.green],
                  textColor: AppColors.black,
                  onTap: () async {
                    await showReviewSubmittedSheet(context);
                    if (mounted) Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
