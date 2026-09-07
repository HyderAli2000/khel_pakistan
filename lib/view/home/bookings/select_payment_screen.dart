import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/bookings/add_card_screen.dart';
import 'package:khel_pakistan/view/home/bookings/booking_confirmed_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

enum PaymentMethod { easypaisa, jazzcash, card }

class SelectPaymentScreen extends StatefulWidget {
  const SelectPaymentScreen({super.key});

  @override
  State<SelectPaymentScreen> createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
  PaymentMethod _selected = PaymentMethod.card;

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
                          color: AppColors.white.withValues(alpha: 0.12),
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
                        'SELECT PAYMENT',
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
              28.verticalSpace,
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  children: [
                    _PaymentOption(
                      selected: _selected == PaymentMethod.easypaisa,
                      onTap: () =>
                          setState(() => _selected = PaymentMethod.easypaisa),
                      leading: _LogoBadge(
                        color: const Color(0xFF21B573),
                        label: 'e',
                      ),
                      title: 'Easypaisa',
                    ),
                    14.verticalSpace,
                    _PaymentOption(
                      selected: _selected == PaymentMethod.jazzcash,
                      onTap: () =>
                          setState(() => _selected = PaymentMethod.jazzcash),
                      leading: _LogoBadge(
                        color: const Color(0xFFE31C23),
                        label: 'J',
                      ),
                      title: 'JazzCash',
                    ),
                    14.verticalSpace,
                    _PaymentOption(
                      selected: _selected == PaymentMethod.card,
                      onTap: () =>
                          setState(() => _selected = PaymentMethod.card),
                      leading: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _CardBrand(color: const Color(0xFFEB001B), text: 'MC'),
                          6.horizontalSpace,
                          _CardBrand(color: const Color(0xFF1A1F71), text: 'VISA'),
                        ],
                      ),
                      title: 'Card or Debit Cards',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                child: AppButton(
                  text: 'Continue',
                  gradientColors: const [AppColors.green],
                  textColor: AppColors.black,
                  onTap: () {
                    if (_selected == PaymentMethod.card) {
                      Get.to(() => const AddCardScreen());
                    } else {
                      Get.to(() => const BookingConfirmedScreen());
                    }
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

class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.selected,
    required this.onTap,
    required this.leading,
    required this.title,
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget leading;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 64.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2433).withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: selected
                ? AppColors.green
                : AppColors.green.withValues(alpha: 0.35),
            width: 1.2,
          ),
        ),
        child: Row(
          children: [
            leading,
            12.horizontalSpace,
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontFamily: AppFonts.satoshi,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
            Container(
              width: 22.w,
              height: 22.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.green, width: 1.5),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: const BoxDecoration(
                          color: AppColors.green,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoBadge extends StatelessWidget {
  const _LogoBadge({required this.color, required this.label});

  final Color color;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 36.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18.sp,
          fontFamily: AppFonts.satoshi,
          fontWeight: FontWeight.w800,
          color: AppColors.white,
        ),
      ),
    );
  }
}

class _CardBrand extends StatelessWidget {
  const _CardBrand({required this.color, required this.text});

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 36.w,
      height: 24.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 8.sp,
          fontFamily: AppFonts.satoshi,
          fontWeight: FontWeight.w800,
          color: AppColors.white,
        ),
      ),
    );
  }
}
