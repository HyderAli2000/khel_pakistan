import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/bookings/select_payment_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.accessBg),
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
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: _BackButton(onTap: () => Get.back()),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    20.verticalSpace,
                    Text(
                      'BOOKING SUMMARY',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 36.sp,
                        fontFamily: AppFonts.rocket,
                        color: AppColors.green,
                      ),
                    ),
                    12.verticalSpace,
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.satoshi,
                        height: 1.4,
                        color: AppColors.white.withValues(alpha: 0.85),
                      ),
                    ),
                    28.verticalSpace,
                    Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            AssetsImages.backOrange,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(28.w, 36.h, 28.w, 36.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Venue: Karachi Sports Arena',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontFamily: AppFonts.satoshi,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                              24.verticalSpace,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _TicketLine('Friday, 10 July'),
                                        8.verticalSpace,
                                        _TicketLine('7:00 PM — 9:00 PM'),
                                        8.verticalSpace,
                                        _TicketLine('Duration: 2 Hours'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        _TicketLine('Ground Fee: Rs. 4,000'),
                                        8.verticalSpace,
                                        _TicketLine('Platform Fee: Rs. 100'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              20.verticalSpace,
                              Text(
                                'Total: Rs. 4,100',
                                style: TextStyle(
                                  fontSize: 26.sp,
                                  fontFamily: AppFonts.satoshi,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              30.verticalSpace,
              Spacer(),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                child: AppButton(
                  text: 'Process to Payment',
                  gradientColors: const [AppColors.green],
                  textColor: AppColors.black,
                  onTap: () => Get.to(() => const SelectPaymentScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketLine extends StatelessWidget {
  const _TicketLine(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 13.sp,
        fontFamily: AppFonts.satoshi,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42.w,
        height: 42.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.orange.withValues(alpha: 0.85),
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
    );
  }
}
