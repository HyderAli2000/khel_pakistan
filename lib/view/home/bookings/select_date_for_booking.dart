import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/view/home/bookings/booking_summary_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/date_time_picker.dart';

class SelectDateForBooking extends StatelessWidget {
  const SelectDateForBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Select Date & Time',
      body: const DateTimePicker(showPlayers: true),
      bottom: AppButton(
        text: 'Continue',
        onTap: () => Get.to(() => const BookingSummaryScreen()),
      ),
    );
  }
}
