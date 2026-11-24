import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/bookings/select_payment_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/summary_card.dart';

class BookingSummaryScreen extends StatelessWidget {
  const BookingSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Booking Summary',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
        children: [
          Text(
            'Please check your booking details before you pay.',
            textAlign: TextAlign.center,
            style: AppTextStyles.bodySecondary.copyWith(fontSize: 13.sp),
          ),
          20.verticalSpace,
          const SummaryCard(
            image: AssetsImages.venue1,
            title: 'Karachi Sports Arena',
            subtitle: 'DHA Phase 6, Karachi',
            rows: [
              ('Date', 'Friday, 10 July'),
              ('Time', '7:00 PM — 9:00 PM'),
              ('Duration', '2 hours'),
              ('Players', '8'),
              ('Ground fee', 'Rs. 4,000'),
              ('Platform fee', 'Rs. 100'),
            ],
            total: 'Rs. 4,100',
          ),
        ],
      ),
      bottom: AppButton(
        text: 'Proceed to Payment',
        onTap: () => Get.to(() => const SelectPaymentScreen()),
      ),
    );
  }
}
