import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/bookingHome/booking_home_detail_screen.dart';

class BookingsHome extends StatefulWidget {
  const BookingsHome({super.key});

  @override
  State<BookingsHome> createState() => _BookingsHomeState();
}

class _BookingsHomeState extends State<BookingsHome> {
  int _selectedTab = 0;

  final List<String> _tabs = const ['Upcoming', 'Ongoing', 'Completed'];

  final List<_BookingData> _bookings = const [
    _BookingData(
      image: AssetsImages.booking1,
      title: 'Karachi Sports Arena',
      status: 'Confirmed',
      date: 'Friday, 18 July',
      time: '7:00 PM — 9:00 PM',
    ),
    _BookingData(
      image: AssetsImages.booking1,
      title: 'Karachi Sports Arena',
      status: 'Confirmed',
      date: 'Friday, 18 July',
      time: '7:00 PM — 9:00 PM',
    ),
    _BookingData(
      image: AssetsImages.booking2,
      title: 'Karachi Sports Arena',
      status: 'Confirmed',
      date: 'Saturday, 19 July',
      time: '6:00 PM — 8:00 PM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1B1C2D),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        children: [
          16.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: List.generate(_tabs.length, (index) {
                final isSelected = _selectedTab == index;
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: index == _tabs.length - 1 ? 0 : 10.w,
                    ),
                    child: GestureDetector(
                      onTap: () => setState(() => _selectedTab = index),
                      child: Container(
                        height: 42.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.green
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(999.r),
                          border: Border.all(
                            color: AppColors.green,
                            width: 1.2,
                          ),
                        ),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontFamily: AppFonts.satoshi,
                            fontWeight: FontWeight.w700,
                            color: isSelected
                                ? AppColors.black
                                : AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
              itemCount: _bookings.length,
              separatorBuilder: (_, __) => 12.verticalSpace,
              itemBuilder: (context, index) {
                return _BookingCard(
                  booking: _bookings[index],
                  status: BookingHomeStatus.values[_selectedTab],
                );
              },
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
    required this.status,
    required this.date,
    required this.time,
  });

  final String image;
  final String title;
  final String status;
  final String date;
  final String time;
}

class _BookingCard extends StatelessWidget {
  const _BookingCard({required this.booking, required this.status});

  final _BookingData booking;
  final BookingHomeStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: const Color(0xFF23243A),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.08)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              booking.image,
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
                        booking.title,
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
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        booking.status,
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
                  'Date: ${booking.date}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: AppFonts.satoshi,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                ),
                4.verticalSpace,
                Text(
                  'Time: ${booking.time}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: AppFonts.satoshi,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                ),
                8.verticalSpace,
                GestureDetector(
                  onTap: () => Get.to(
                    () => BookingHomeDetailScreen(
                      image: booking.image,
                      title: booking.title,
                      status: status,
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
  }
}
