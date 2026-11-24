import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/navbar_user.dart';
import 'package:khel_pakistan/widgets/success_view.dart';
import 'package:khel_pakistan/widgets/summary_card.dart';

class TournamentBookingCnfrmScreen extends StatelessWidget {
  const TournamentBookingCnfrmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      title: 'Registration Confirmed!',
      message:
          'Your team is in. We will share the match schedule on WhatsApp '
          'before the tournament starts.',
      details: const SummaryCard(
        image: AssetsImages.tournament1,
        title: 'Karachi Champions League 2026',
        subtitle: 'Registration ID: KP-T-20345',
        rows: [
          ('Team', 'Karachi United'),
          ('Dates', '18 - 20 July'),
          ('Paid', 'Rs. 5,100'),
        ],
      ),
      primaryText: 'Back to Home',
      onPrimary: () => Get.offAll(() => const NavbarUser()),
    );
  }
}
