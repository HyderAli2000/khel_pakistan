import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/navbar_user.dart';
import 'package:khel_pakistan/widgets/success_view.dart';
import 'package:khel_pakistan/widgets/summary_card.dart';

class BookingConfirmedScreen extends StatelessWidget {
  const BookingConfirmedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      title: 'Booking Confirmed!',
      message:
          'Your ground is booked. We have sent the details to your email '
          'and WhatsApp.',
      details: const SummaryCard(
        image: AssetsImages.venue1,
        title: 'Karachi Sports Arena',
        subtitle: 'Booking ID: KP-247891',
        rows: [
          ('Date', 'Friday, 18 July'),
          ('Time', '7:00 PM — 9:00 PM'),
          ('Paid', 'Rs. 4,100'),
        ],
      ),
      primaryText: 'Back to Home',
      onPrimary: () => Get.offAll(() => const NavbarUser()),
    );
  }
}
