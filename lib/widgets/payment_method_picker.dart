import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';

enum PaymentMethod { easypaisa, jazzcash, card }

/// Radio list of payment methods (Easypaisa, JazzCash, card).
class PaymentMethodPicker extends StatelessWidget {
  const PaymentMethodPicker({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final PaymentMethod selected;
  final ValueChanged<PaymentMethod> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _PaymentOption(
          selected: selected == PaymentMethod.easypaisa,
          onTap: () => onChanged(PaymentMethod.easypaisa),
          leading: const _LogoBadge(color: Color(0xFF21B573), label: 'e'),
          title: 'Easypaisa',
          subtitle: 'Pay from your Easypaisa wallet',
        ),
        12.verticalSpace,
        _PaymentOption(
          selected: selected == PaymentMethod.jazzcash,
          onTap: () => onChanged(PaymentMethod.jazzcash),
          leading: const _LogoBadge(color: Color(0xFFE31C23), label: 'J'),
          title: 'JazzCash',
          subtitle: 'Pay from your JazzCash wallet',
        ),
        12.verticalSpace,
        _PaymentOption(
          selected: selected == PaymentMethod.card,
          onTap: () => onChanged(PaymentMethod.card),
          leading: Container(
            width: 40.r,
            height: 40.r,
            decoration: const BoxDecoration(
              color: AppColors.dark,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.credit_card_rounded,
              size: 20.r,
              color: AppColors.primary,
            ),
          ),
          title: 'Credit / Debit Card',
          subtitle: 'Visa, Mastercard',
        ),
      ],
    );
  }
}

/// Payment row with a radio dot; dark border when selected.
class _PaymentOption extends StatelessWidget {
  const _PaymentOption({
    required this.selected,
    required this.onTap,
    required this.leading,
    required this.title,
    required this.subtitle,
  });

  final bool selected;
  final VoidCallback onTap;
  final Widget leading;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: selected ? AppColors.dark : AppColors.divider,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            leading,
            12.horizontalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  2.verticalSpace,
                  Text(subtitle, style: AppTextStyles.caption),
                ],
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              width: 22.r,
              height: 22.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: selected ? AppColors.primary : Colors.transparent,
                border: Border.all(
                  color: selected ? AppColors.dark : AppColors.border,
                  width: 1.5,
                ),
              ),
              child: selected
                  ? Icon(Icons.check, size: 14.r, color: AppColors.onPrimary)
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
      width: 40.r,
      height: 40.r,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        label,
        style: AppTextStyles.h2.copyWith(
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
    );
  }
}
