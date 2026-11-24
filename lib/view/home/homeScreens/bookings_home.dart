import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/bookingHome/booking_home_detail_screen.dart';
import 'package:khel_pakistan/widgets/app_card.dart';
import 'package:khel_pakistan/widgets/page_header.dart';
import 'package:khel_pakistan/widgets/segmented_tabs.dart';

class BookingsHome extends StatefulWidget {
  const BookingsHome({super.key});

  @override
  State<BookingsHome> createState() => _BookingsHomeState();
}

class _BookingsHomeState extends State<BookingsHome> {
  int _selectedTab = 0;

  static const _tabs = ['Upcoming', 'Ongoing', 'Completed'];

  static const _bookings = [
    _BookingData(
      image: AssetsImages.venue1,
      title: 'Karachi Sports Arena',
      location: 'DHA Phase 6, Karachi',
      date: 'Friday, 18 July',
      time: '7:00 PM — 9:00 PM',
    ),
    _BookingData(
      image: AssetsImages.venue2,
      title: 'Legends Padel Club',
      location: 'Clifton, Karachi',
      date: 'Saturday, 19 July',
      time: '6:00 PM — 8:00 PM',
    ),
    _BookingData(
      image: AssetsImages.venue1,
      title: 'Arena 51 Football',
      location: 'Gulshan, Karachi',
      date: 'Sunday, 20 July',
      time: '8:00 PM — 10:00 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final status = BookingHomeStatus.values[_selectedTab];
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const PageHeader(title: 'My Bookings'),
          12.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: SegmentedTabs(
              tabs: _tabs,
              selected: _selectedTab,
              onChanged: (i) => setState(() => _selectedTab = i),
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(
                16.w,
                0,
                16.w,
                MediaQuery.paddingOf(context).bottom + 16.h,
              ),
              itemCount: _bookings.length,
              separatorBuilder: (_, __) => 12.verticalSpace,
              itemBuilder: (_, i) =>
                  _BookingCard(booking: _bookings[i], status: status),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingData {
  const _BookingData({
    required this.image,
    required this.title,
    required this.location,
    required this.date,
    required this.time,
  });

  final String image;
  final String title;
  final String location;
  final String date;
  final String time;
}

class _BookingCard extends StatelessWidget {
  const _BookingCard({required this.booking, required this.status});

  final _BookingData booking;
  final BookingHomeStatus status;

  void _open() => Get.to(
    () => BookingHomeDetailScreen(
      image: booking.image,
      title: booking.title,
      status: status,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: _open,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              booking.image,
              width: 92.r,
              height: 92.r,
              fit: BoxFit.cover,
            ),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        booking.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.subtitle.copyWith(fontSize: 15.sp),
                      ),
                    ),
                    8.horizontalSpace,
                    StatusChip(status: status),
                  ],
                ),
                4.verticalSpace,
                Text(booking.location, style: AppTextStyles.caption),
                10.verticalSpace,
                _InfoRow(
                  icon: Icons.calendar_today_outlined,
                  text: booking.date,
                ),
                4.verticalSpace,
                _InfoRow(icon: Icons.schedule_rounded, text: booking.time),
              ],
            ),
          ),
          4.horizontalSpace,
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14.r, color: AppColors.textSecondary),
        6.horizontalSpace,
        Text(
          text,
          style: AppTextStyles.caption.copyWith(color: AppColors.textPrimary),
        ),
      ],
    );
  }
}

/// Booking status pill: lime = confirmed, dark = in progress, grey = done.
class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.status});

  final BookingHomeStatus status;

  @override
  Widget build(BuildContext context) {
    final (label, bg, fg) = switch (status) {
      BookingHomeStatus.upcoming => (
        'Confirmed',
        AppColors.primary,
        AppColors.onPrimary,
      ),
      BookingHomeStatus.ongoing => (
        'In Progress',
        AppColors.dark,
        AppColors.primary,
      ),
      BookingHomeStatus.completed => (
        'Completed',
        AppColors.inputFill,
        AppColors.textSecondary,
      ),
    };
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          fontSize: 11.sp,
          fontWeight: FontWeight.w600,
          color: fg,
        ),
      ),
    );
  }
}
