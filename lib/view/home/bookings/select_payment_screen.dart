import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/view/home/bookings/add_card_screen.dart';
import 'package:khel_pakistan/view/home/bookings/booking_confirmed_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/payment_method_picker.dart';

class SelectPaymentScreen extends StatefulWidget {
  const SelectPaymentScreen({super.key});

  @override
  State<SelectPaymentScreen> createState() => _SelectPaymentScreenState();
}

class _SelectPaymentScreenState extends State<SelectPaymentScreen> {
  PaymentMethod _selected = PaymentMethod.card;

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Select Payment',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
        children: [
          const FieldLabel('Amount to pay'),
          Text('Rs. 4,100', style: AppTextStyles.h1.copyWith(fontSize: 28.sp)),
          24.verticalSpace,
          const FieldLabel('Payment method'),
          PaymentMethodPicker(
            selected: _selected,
            onChanged: (m) => setState(() => _selected = m),
          ),
        ],
      ),
      bottom: AppButton(
        text: 'Continue',
        onTap: () => _selected == PaymentMethod.card
            ? Get.to(() => const AddCardScreen())
            : Get.to(() => const BookingConfirmedScreen()),
      ),
    );
  }
}
