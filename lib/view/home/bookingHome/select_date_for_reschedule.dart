import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/view/home/bookingHome/reschedule_confirmed_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/date_time_picker.dart';

class SelectDateForReschedule extends StatelessWidget {
  const SelectDateForReschedule({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Reschedule Booking',
      body: const DateTimePicker(),
      bottom: AppButton(
        text: 'Confirm New Time',
        onTap: () => Get.to(() => const RescheduleConfirmedScreen()),
      ),
    );
  }
}
