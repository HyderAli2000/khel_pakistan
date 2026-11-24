import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/navbar_user.dart';
import 'package:khel_pakistan/widgets/success_view.dart';
import 'package:khel_pakistan/widgets/summary_card.dart';

class RescheduleConfirmedScreen extends StatelessWidget {
  const RescheduleConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      title: 'Reschedule Confirmed',
      message: 'Your booking has been moved to the new time.',
      details: const SummaryCard(
        image: AssetsImages.venue1,
        title: 'Karachi Sports Arena',
        subtitle: 'Booking ID: KP-247891',
        rows: [
          ('New date', 'Saturday, 19 July'),
          ('New time', '7:00 PM — 9:00 PM'),
        ],
      ),
      primaryText: 'Back to Home',
      onPrimary: () => Get.offAll(() => const NavbarUser()),
    );
  }
}
