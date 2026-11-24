import 'package:flutter/material.dart';
import 'package:khel_pakistan/widgets/success_view.dart';

Future<void> showPasswordUpdatedSheet(BuildContext context) {
  return showSuccessSheet(
    context,
    title: 'Password Updated',
    message: 'Your password has been updated successfully.',
  );
}
