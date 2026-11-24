import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_detail_screen.dart';
import 'package:khel_pakistan/widgets/app_card.dart';
import 'package:khel_pakistan/widgets/app_page.dart';

class TournamentHistoryScreen extends StatelessWidget {
  const TournamentHistoryScreen({super.key});

  static const _items = [
    _HistoryItem(
      image: AssetsImages.tournament1,
      title: 'Global Football Fan Day',
      sport: 'Football',
      date: '18 - 20 July',
      time: '6 - 11 PM',
      result: 'Semi-finalist',
    ),
    _HistoryItem(
      image: AssetsImages.tournament2,
      title: 'Karachi Padel Open',
      sport: 'Padel',
      date: '02 - 03 June',
      time: '5 - 10 PM',
      result: 'Winner',
    ),
    _HistoryItem(
      image: AssetsImages.tournament1,
      title: 'Karachi Champions League',
      sport: 'Football',
      date: '12 - 14 April',
      time: '6 - 11 PM',
      result: 'Group stage',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Tournament History',
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
        itemCount: _items.length,
        separatorBuilder: (_, __) => 12.verticalSpace,
        itemBuilder: (_, i) => _HistoryCard(item: _items[i]),
      ),
    );
  }
}

class _HistoryItem {
  const _HistoryItem({
    required this.image,
    required this.title,
    required this.sport,
    required this.date,
    required this.time,
    required this.result,
  });

  final String image;
  final String title;
  final String sport;
  final String date;
  final String time;
  final String result;
}

class _HistoryCard extends StatelessWidget {
  const _HistoryCard({required this.item});

  final _HistoryItem item;

  @override
  Widget build(BuildContext context) {
    final won = item.result == 'Winner';
    return AppCard(
      onTap: () => Get.to(
        () => TournamentDetailScreen(
          image: item.image,
          title: item.title,
          sport: item.sport,
          showJoinBar: false,
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              item.image,
              width: 88.r,
              height: 88.r,
              fit: BoxFit.cover,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.subtitle.copyWith(fontSize: 15.sp),
                ),
                4.verticalSpace,
                Text(
                  '${item.sport} · ${item.date} · ${item.time}',
                  style: AppTextStyles.caption,
                ),
                10.verticalSpace,
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: won ? AppColors.primary : AppColors.card,
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        won ? Icons.emoji_events_rounded : Icons.flag_outlined,
                        size: 13.r,
                        color: AppColors.textPrimary,
                      ),
                      4.horizontalSpace,
                      Text(
                        item.result,
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.chevron_right_rounded,
            color: AppColors.textHint,
            size: 22.r,
          ),
        ],
      ),
    );
  }
}
