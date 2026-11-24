import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/widgets/success_view.dart';

class ProfileUpdatedScreen extends StatelessWidget {
  const ProfileUpdatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SuccessScreen(
      title: 'Profile Updated',
      message: 'Your profile has been updated successfully.',
      primaryText: 'Continue',
      // Close this screen and the edit screen behind it.
      onPrimary: () => Get.close(2),
    );
  }
}
