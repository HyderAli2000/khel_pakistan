import 'package:flutter/material.dart';
import 'package:khel_pakistan/widgets/success_view.dart';

Future<void> showReviewSubmittedSheet(BuildContext context) {
  return showSuccessSheet(
    context,
    title: 'Review Submitted',
    message: 'Thank you! Your rating & review has been submitted successfully.',
  );
}
