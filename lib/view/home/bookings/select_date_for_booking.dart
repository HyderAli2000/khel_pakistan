import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/bookings/booking_summary_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class SelectDateForBooking extends StatefulWidget {
  const SelectDateForBooking({super.key});

  @override
  State<SelectDateForBooking> createState() => _SelectDateForBookingState();
}

class _SelectDateForBookingState extends State<SelectDateForBooking> {
  int _selectedDateIndex = 2;
  int _selectedDuration = 2;
  int? _selectedSlotIndex;
  final TextEditingController _playersController = TextEditingController();

  late final List<_DateOption> _dates;

  final List<int> _durations = const [1, 2, 3, 4, 5, 6];

  final List<_TimeSlot> _slots = const [
    _TimeSlot(time: '01:00 AM', price: 'Rs 3,000/hr'),
    _TimeSlot(time: '03:00 AM', price: 'Rs 3,000/hr'),
    _TimeSlot(time: '05:00 AM', price: 'Rs 3,000/hr'),
    _TimeSlot(time: '07:00 AM', price: 'Rs 3,000/hr'),
    _TimeSlot(time: '09:00 AM', price: 'Rs 3,000/hr'),
    _TimeSlot(time: '11:00 AM', price: 'Rs 3,000/hr'),
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _dates = List.generate(7, (index) {
      final date = now.add(Duration(days: index));
      return _DateOption(
        day: _weekday(date.weekday),
        date: date.day.toString().padLeft(2, '0'),
        month: _month(date.month),
      );
    });
  }

  @override
  void dispose() {
    _playersController.dispose();
    super.dispose();
  }

  String _weekday(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }

  String _month(int month) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 40.w,
                        height: 40.w,
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
                        'SELECT DATE & TIME',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontFamily: AppFonts.rocket,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 40.w),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 100.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _dates.length,
                          separatorBuilder: (_, __) => 10.horizontalSpace,
                          itemBuilder: (context, index) {
                            final item = _dates[index];
                            final selected = _selectedDateIndex == index;
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => _selectedDateIndex = index),
                              child: Container(
                                width: 72.w,
                                decoration: BoxDecoration(
                                  color: selected
                                      ? AppColors.orange
                                      : AppColors.green.withValues(alpha: 0.05),
                                  borderRadius: BorderRadius.circular(14.r),
                                  border: Border.all(
                                    color: AppColors.green.withValues(
                                      alpha: 0.20,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      item.day,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: AppFonts.satoshi,
                                        color: selected
                                            ? AppColors.white
                                            : AppColors.white.withValues(
                                                alpha: 0.6,
                                              ),
                                      ),
                                    ),
                                    6.verticalSpace,
                                    Text(
                                      item.date,
                                      style: TextStyle(
                                        fontSize: 22.sp,
                                        fontFamily: AppFonts.satoshi,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    4.verticalSpace,
                                    Text(
                                      item.month,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: AppFonts.satoshi,
                                        color: selected
                                            ? AppColors.white
                                            : AppColors.white.withValues(
                                                alpha: 0.6,
                                              ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      22.verticalSpace,
                      Text(
                        'Duration',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      12.verticalSpace,
                      Row(
                        children: _durations.map((hours) {
                          final selected = _selectedDuration == hours;
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: hours == _durations.last ? 0 : 8.w,
                              ),
                              child: GestureDetector(
                                onTap: () =>
                                    setState(() => _selectedDuration = hours),
                                child: Container(
                                  height: 40.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: selected
                                        ? AppColors.orange
                                        : AppColors.green.withValues(
                                            alpha: 0.05,
                                          ),
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                      color: AppColors.green.withValues(
                                        alpha: 0.20,
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    '${hours}h',
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: AppFonts.satoshi,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      22.verticalSpace,
                      Text(
                        'Select a Time Slot',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      12.verticalSpace,
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _slots.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 12.h,
                          crossAxisSpacing: 12.w,
                          childAspectRatio: 2.1,
                        ),
                        itemBuilder: (context, index) {
                          final slot = _slots[index];
                          final selected = _selectedSlotIndex == index;
                          return GestureDetector(
                            onTap: () =>
                                setState(() => _selectedSlotIndex = index),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 14.w),
                              decoration: BoxDecoration(
                                color: selected
                                    ? AppColors.orange.withValues(alpha: 0.25)
                                    : AppColors.green.withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(14.r),
                                border: Border.all(
                                  color: selected
                                      ? AppColors.orange
                                      : AppColors.green.withValues(alpha: 0.20),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    slot.time,
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: AppFonts.satoshi,
                                      fontWeight: FontWeight.w700,
                                      color: AppColors.white,
                                    ),
                                  ),
                                  4.verticalSpace,
                                  Text(
                                    '${_selectedDuration}h • ${slot.price}',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: AppFonts.satoshi,
                                      color: AppColors.white.withValues(
                                        alpha: 0.55,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      22.verticalSpace,
                      Text(
                        'Number of Player',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      12.verticalSpace,
                      TextField(
                        controller: _playersController,
                        keyboardType: TextInputType.number,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: AppFonts.satoshi,
                          color: AppColors.white,
                        ),
                        cursorColor: AppColors.green,
                        decoration: InputDecoration(
                          hintText: 'Number of Player',
                          hintStyle: TextStyle(
                            fontSize: 15.sp,
                            fontFamily: AppFonts.satoshi,
                            color: AppColors.white.withValues(alpha: 0.45),
                          ),
                          filled: true,
                          fillColor: const Color(0xFF23243A),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 16.h,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(999999.r),
                            borderSide: BorderSide(
                              color: AppColors.white.withValues(alpha: 0.08),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(999999.r),
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
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 16.h),
                child: AppButton(
                  text: 'Continue',
                  gradientColors: const [AppColors.green],
                  textColor: AppColors.black,
                  onTap: () => Get.to(() => const BookingSummaryScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DateOption {
  const _DateOption({
    required this.day,
    required this.date,
    required this.month,
  });

  final String day;
  final String date;
  final String month;
}

class _TimeSlot {
  const _TimeSlot({required this.time, required this.price});

  final String time;
  final String price;
}
