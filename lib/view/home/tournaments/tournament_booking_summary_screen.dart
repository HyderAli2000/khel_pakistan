import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/bookings/add_card_screen.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_booking_cnfrm.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/payment_method_picker.dart';
import 'package:khel_pakistan/widgets/summary_card.dart';

class TournamentBookingSummaryScreen extends StatefulWidget {
  const TournamentBookingSummaryScreen({super.key});

  @override
  State<TournamentBookingSummaryScreen> createState() =>
      _TournamentBookingSummaryScreenState();
}

class _TournamentBookingSummaryScreenState
    extends State<TournamentBookingSummaryScreen> {
  PaymentMethod _method = PaymentMethod.card;
  bool _agreeRules = true;
  bool _agreeCancel = false;

  bool get _canContinue => _agreeRules && _agreeCancel;

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Registration Summary',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
        children: [
          const SummaryCard(
            image: AssetsImages.tournament1,
            title: 'Karachi Champions League 2026',
            subtitle: 'Karachi Sports Arena · DHA Phase 6',
            rows: [
              ('Team', 'Karachi United'),
              ('Dates', '18 - 20 July'),
              ('Match time', '6 - 11 PM'),
              ('Entry fee', 'Rs. 5,000'),
              ('Platform fee', 'Rs. 100'),
            ],
            total: 'Rs. 5,100',
          ),
          24.verticalSpace,
          const FieldLabel('Payment method'),
          PaymentMethodPicker(
            selected: _method,
            onChanged: (m) => setState(() => _method = m),
          ),
          18.verticalSpace,
          _AgreeRow(
            value: _agreeRules,
            label: 'I agree to the tournament rules.',
            onChanged: (v) => setState(() => _agreeRules = v),
          ),
          _AgreeRow(
            value: _agreeCancel,
            label: 'I understand the cancellation policy.',
            onChanged: (v) => setState(() => _agreeCancel = v),
          ),
        ],
      ),
      bottom: Opacity(
        opacity: _canContinue ? 1 : 0.5,
        child: AppButton(
          text: 'Continue to Pay',
          onTap: () {
            if (!_canContinue) return;
            _method == PaymentMethod.card
                ? Get.to(() => const AddCardScreen(fromTournament: true))
                : Get.to(() => const TournamentBookingCnfrmScreen());
          },
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
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      borderRadius: BorderRadius.circular(8.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 20.r,
              height: 20.r,
              decoration: BoxDecoration(
                color: value ? AppColors.primary : AppColors.surface,
                borderRadius: BorderRadius.circular(5.r),
                border: Border.all(
                  color: value ? AppColors.dark : AppColors.border,
                ),
              ),
              child: value
                  ? Icon(Icons.check, size: 14.r, color: AppColors.onPrimary)
                  : null,
            ),
            10.horizontalSpace,
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.body.copyWith(fontSize: 13.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
