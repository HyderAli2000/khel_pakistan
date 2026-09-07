import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/bookings/add_card_screen.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_booking_cnfrm.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

enum _PaymentMethod { easypaisa, jazzcash, card }

class TournamentBookingSummaryScreen extends StatefulWidget {
  const TournamentBookingSummaryScreen({super.key});

  @override
  State<TournamentBookingSummaryScreen> createState() =>
      _TournamentBookingSummaryScreenState();
}

class _TournamentBookingSummaryScreenState
    extends State<TournamentBookingSummaryScreen> {
  _PaymentMethod _selected = _PaymentMethod.card;
  bool _agreeRules = true;
  bool _agreeCancel = false;

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
                          color: AppColors.white.withValues(alpha: 0.08),
                          border: Border.all(
                            color: AppColors.green.withValues(alpha: 0.55),
                          ),
                        ),
                        child: Image.asset(
                          AssetsIcons.back,
                          width: 16.w,
                          height: 16.h,
                          color: AppColors.green,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.green,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'BOOKING SUMMARY',
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
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Positioned.fill(
                            child: Image.asset(
                              AssetsImages.backOrange,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                              24.w,
                              28.h,
                              24.w,
                              24.h,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Venue: Karachi Sports Arena',
                                  style: TextStyle(
                                    fontSize: 17.sp,
                                    fontFamily: AppFonts.satoshi,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                  ),
                                ),
                                18.verticalSpace,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Booking Details',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: AppFonts.satoshi,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white.withValues(
                                                alpha: 0.85,
                                              ),
                                            ),
                                          ),
                                          8.verticalSpace,
                                          Text(
                                            'Friday, 10 July',
                                            style: _ticketBodyStyle,
                                          ),
                                          4.verticalSpace,
                                          Text(
                                            '7:00 PM — 9:00 PM',
                                            style: _ticketBodyStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Price Breakdown',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontFamily: AppFonts.satoshi,
                                              fontWeight: FontWeight.w600,
                                              color: AppColors.white.withValues(
                                                alpha: 0.85,
                                              ),
                                            ),
                                          ),
                                          8.verticalSpace,
                                          Text(
                                            'Entry Fee ........ Rs. 5,000',
                                            style: _ticketBodyStyle,
                                          ),
                                          4.verticalSpace,
                                          Text(
                                            'Platform Fee .... Rs. 100',
                                            style: _ticketBodyStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                20.verticalSpace,
                                Text(
                                  'Total: Rs. 5,100',
                                  style: TextStyle(
                                    fontSize: 22.sp,
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
                      24.verticalSpace,
                      Text(
                        'Select Payment',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      12.verticalSpace,
                      _PaymentTile(
                        selected: _selected == _PaymentMethod.easypaisa,
                        onTap: () => setState(
                          () => _selected = _PaymentMethod.easypaisa,
                        ),
                        leading: _LogoBadge(
                          color: const Color(0xFF21B573),
                          label: 'e',
                        ),
                        title: 'Easypaisa',
                      ),
                      10.verticalSpace,
                      _PaymentTile(
                        selected: _selected == _PaymentMethod.jazzcash,
                        onTap: () =>
                            setState(() => _selected = _PaymentMethod.jazzcash),
                        leading: _LogoBadge(
                          color: const Color(0xFFE31C23),
                          label: 'J',
                        ),
                        title: 'JazzCash',
                      ),
                      10.verticalSpace,
                      _PaymentTile(
                        selected: _selected == _PaymentMethod.card,
                        onTap: () =>
                            setState(() => _selected = _PaymentMethod.card),
                        leading: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _CardBrand(
                              color: const Color(0xFFEB001B),
                              text: 'MC',
                            ),
                            6.horizontalSpace,
                            _CardBrand(
                              color: const Color(0xFF1A1F71),
                              text: 'VISA',
                            ),
                          ],
                        ),
                        title: 'Card or Debit Cards',
                      ),
                      20.verticalSpace,
                      _AgreeRow(
                        value: _agreeRules,
                        label: 'I agree to the tournament rules.',
                        onChanged: (v) =>
                            setState(() => _agreeRules = v ?? false),
                      ),
                      10.verticalSpace,
                      _AgreeRow(
                        value: _agreeCancel,
                        label: 'I understand the cancellation policy.',
                        onChanged: (v) =>
                            setState(() => _agreeCancel = v ?? false),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                child: AppButton(
                  text: 'Continue',
                  gradientColors: const [AppColors.green],
                  textColor: AppColors.black,
                  onTap: () {
                    if (!_agreeRules) return;
                    if (_selected == _PaymentMethod.card) {
                      Get.to(() => const AddCardScreen(fromTournament: true));
                    } else {
                      Get.to(() => const TournamentBookingCnfrmScreen());
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

  TextStyle get _ticketBodyStyle => TextStyle(
    fontSize: 12.sp,
    fontFamily: AppFonts.satoshi,
    fontWeight: FontWeight.w500,
    color: AppColors.white,
  );
}

class _PaymentTile extends StatelessWidget {
  const _PaymentTile({
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
        height: 58.h,
        padding: EdgeInsets.symmetric(horizontal: 14.w),
        decoration: BoxDecoration(
          color: const Color(0xFF1E2433).withValues(alpha: 0.75),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: selected
                ? AppColors.green
                : AppColors.green.withValues(alpha: 0.35),
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
                  fontSize: 14.sp,
                  fontFamily: AppFonts.satoshi,
                  fontWeight: FontWeight.w600,
                  color: AppColors.white,
                ),
              ),
            ),
            Container(
              width: 20.w,
              height: 20.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.green, width: 1.5),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 10.w,
                        height: 10.w,
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

class _AgreeRow extends StatelessWidget {
  const _AgreeRow({
    required this.value,
    required this.label,
    required this.onChanged,
  });

  final bool value;
  final String label;
  final ValueChanged<bool?> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          Container(
            width: 22.w,
            height: 22.w,
            decoration: BoxDecoration(
              color: value ? AppColors.green : Colors.transparent,
              borderRadius: BorderRadius.circular(5.r),
              border: Border.all(color: AppColors.green, width: 1.5),
            ),
            child: value
                ? Icon(Icons.check, size: 14.sp, color: AppColors.black)
                : null,
          ),
          10.horizontalSpace,
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: AppFonts.satoshi,
                color: AppColors.white.withValues(alpha: 0.65),
              ),
            ),
          ),
        ],
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
      width: 32.w,
      height: 32.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16.sp,
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
      width: 34.w,
      height: 22.h,
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
