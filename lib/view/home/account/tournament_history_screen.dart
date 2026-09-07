import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_detail_screen.dart';

class TournamentHistoryScreen extends StatelessWidget {
  const TournamentHistoryScreen({super.key});

  final List<_HistoryItem> _items = const [
    _HistoryItem(
      image: AssetsImages.badminton,
      title: 'Karachi Champions League 2026',
      date: '18 - 20 July',
      time: '6 - 11 PM',
    ),
    _HistoryItem(
      image: AssetsImages.badminton,
      title: 'Karachi Champions League 2026',
      date: '18 - 20 July',
      time: '6 - 11 PM',
    ),
    _HistoryItem(
      image: AssetsImages.badminton,
      title: 'Karachi Champions League 2026',
      date: '18 - 20 July',
      time: '6 - 11 PM',
    ),
  ];

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
                        'TOURNAMENT HISTORY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontFamily: AppFonts.rocket,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 42.w),
                  ],
                ),
              ),
              16.verticalSpace,
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
                  itemCount: _items.length,
                  separatorBuilder: (_, __) => 12.verticalSpace,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    return Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: const Color(0xFF23243A),
                        borderRadius: BorderRadius.circular(16.r),
                        border: Border.all(
                          color: AppColors.white.withValues(alpha: 0.08),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Image.asset(
                              item.image,
                              width: 88.w,
                              height: 88.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        item.title,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontFamily: AppFonts.satoshi,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                    8.horizontalSpace,
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10.w,
                                        vertical: 4.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.orange,
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Text(
                                        'Joined',
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontFamily: AppFonts.satoshi,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                8.verticalSpace,
                                Text(
                                  'Date: ${item.date}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: AppFonts.satoshi,
                                    color: AppColors.white.withValues(
                                      alpha: 0.55,
                                    ),
                                  ),
                                ),
                                4.verticalSpace,
                                Text(
                                  'Time: ${item.time}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: AppFonts.satoshi,
                                    color: AppColors.white.withValues(
                                      alpha: 0.55,
                                    ),
                                  ),
                                ),
                                8.verticalSpace,
                                GestureDetector(
                                  onTap: () => Get.to(
                                    () => TournamentDetailScreen(
                                      image: item.image,
                                      title: item.title,
                                      showJoinBar: false,
                                    ),
                                  ),
                                  child: Text(
                                    'View Details',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: AppFonts.satoshi,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.green,
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
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

class _HistoryItem {
  const _HistoryItem({
    required this.image,
    required this.title,
    required this.date,
    required this.time,
  });

  final String image;
  final String title;
  final String date;
  final String time;
}
