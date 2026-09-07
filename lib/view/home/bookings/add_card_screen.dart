import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/bookings/booking_confirmed_screen.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_booking_cnfrm.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class AddCardScreen extends StatefulWidget {
  const AddCardScreen({super.key, this.fromTournament = false});

  final bool fromTournament;

  @override
  State<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends State<AddCardScreen> {
  final _cardNumberController = TextEditingController();
  final _expiryController = TextEditingController();
  final _cvcController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryController.dispose();
    _cvcController.dispose();
    _nameController.dispose();
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
                        'ADD CARD',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 32.sp,
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
                  child: Column(
                    children: [
                      _CardField(
                        controller: _cardNumberController,
                        hint: 'Card Number',
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(16),
                        ],
                      ),
                      14.verticalSpace,
                      Row(
                        children: [
                          Expanded(
                            child: _CardField(
                              controller: _expiryController,
                              hint: 'MM/YY',
                              keyboardType: TextInputType.datetime,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(5),
                              ],
                            ),
                          ),
                          12.horizontalSpace,
                          Expanded(
                            child: _CardField(
                              controller: _cvcController,
                              hint: 'CVC',
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(4),
                              ],
                            ),
                          ),
                        ],
                      ),
                      14.verticalSpace,
                      _CardField(
                        controller: _nameController,
                        hint: 'Name of card Holder',
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.words,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                child: Column(
                  children: [
                    Text(
                      'Your payment is encrypted and processed securely.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: AppFonts.satoshi,
                        color: AppColors.white.withValues(alpha: 0.75),
                      ),
                    ),
                    14.verticalSpace,
                    AppButton(
                      text: 'Pay Now',
                      gradientColors: const [AppColors.green],
                      textColor: AppColors.black,
                      onTap: () {
                        if (widget.fromTournament) {
                          Get.to(() => const TournamentBookingCnfrmScreen());
                        } else {
                          Get.to(() => const BookingConfirmedScreen());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CardField extends StatelessWidget {
  const _CardField({
    required this.controller,
    required this.hint,
    this.keyboardType,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.none,
  });

  final TextEditingController controller;
  final String hint;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextCapitalization textCapitalization;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      textCapitalization: textCapitalization,
      style: TextStyle(
        fontSize: 15.sp,
        fontFamily: AppFonts.satoshi,
        color: AppColors.white,
      ),
      cursorColor: AppColors.green,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 15.sp,
          fontFamily: AppFonts.satoshi,
          color: AppColors.white.withValues(alpha: 0.45),
        ),
        filled: true,
        fillColor: const Color(0xFF23283A).withValues(alpha: 0.85),
        contentPadding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(99999.r),
          borderSide: BorderSide(
            color: AppColors.white.withValues(alpha: 0.12),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(99999.r),
          borderSide: const BorderSide(color: AppColors.green),
        ),
      ),
    );
  }
}
