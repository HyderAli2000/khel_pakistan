import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/view/home/bookings/booking_confirmed_screen.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_booking_cnfrm.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';

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
  void initState() {
    super.initState();
    // Live-update the card preview.
    for (final c in [
      _cardNumberController,
      _expiryController,
      _nameController,
    ]) {
      c.addListener(() => setState(() {}));
    }
  }

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
    return AppPage(
      title: 'Add Card',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
        children: [
          _CardPreview(
            number: _cardNumberController.text,
            expiry: _expiryController.text,
            name: _nameController.text,
          ),
          24.verticalSpace,
          AppTextField(
            label: 'Card Number',
            hintText: '1234 5678 9012 3456',
            controller: _cardNumberController,
            prefixIconData: Icons.credit_card_rounded,
            keyboardType: TextInputType.number,
            textInputAction: TextInputAction.next,
          ),
          14.verticalSpace,
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  label: 'Expiry',
                  hintText: 'MM/YY',
                  controller: _expiryController,
                  prefixIconData: Icons.calendar_today_outlined,
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                ),
              ),
              12.horizontalSpace,
              Expanded(
                child: AppTextField(
                  label: 'CVC',
                  hintText: '123',
                  controller: _cvcController,
                  prefixIconData: Icons.lock_outline_rounded,
                  keyboardType: TextInputType.number,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                ),
              ),
            ],
          ),
          14.verticalSpace,
          AppTextField(
            label: 'Card Holder Name',
            hintText: 'Name on card',
            controller: _nameController,
            prefixIconData: Icons.person_outline_rounded,
          ),
          20.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.verified_user_outlined,
                size: 16.r,
                color: AppColors.textSecondary,
              ),
              6.horizontalSpace,
              Flexible(
                child: Text(
                  'Your payment is encrypted and processed securely.',
                  style: AppTextStyles.caption,
                ),
              ),
            ],
          ),
        ],
      ),
      bottom: AppButton(
        text: 'Pay Now',
        onTap: () => widget.fromTournament
            ? Get.to(() => const TournamentBookingCnfrmScreen())
            : Get.to(() => const BookingConfirmedScreen()),
      ),
    );
  }
}

/// Dark card mock-up that mirrors what the user types.
class _CardPreview extends StatelessWidget {
  const _CardPreview({
    required this.number,
    required this.expiry,
    required this.name,
  });

  final String number;
  final String expiry;
  final String name;

  @override
  Widget build(BuildContext context) {
    final white = AppTextStyles.body.copyWith(color: AppColors.white);
    return AspectRatio(
      aspectRatio: 1.7,
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Stack(
          children: [
            // Decorative circle, clipped by the card's rounded corners.
            Positioned(
              right: -50.r,
              top: -50.r,
              child: Container(
                width: 160.r,
                height: 160.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withValues(alpha: 0.9),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.sim_card_outlined,
                    color: AppColors.white,
                    size: 30.r,
                  ),
                  const Spacer(),
                  Text(
                    number.isEmpty ? '•••• •••• •••• ••••' : number,
                    style: white.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 2,
                    ),
                  ),
                  14.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          name.isEmpty ? 'CARD HOLDER' : name.toUpperCase(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: white.copyWith(fontSize: 12.sp),
                        ),
                      ),
                      Text(
                        expiry.isEmpty ? 'MM/YY' : expiry,
                        style: white.copyWith(fontSize: 12.sp),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
