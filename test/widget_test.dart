import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khel_pakistan/main.dart';
import 'package:khel_pakistan/utils/assets_images.dart';

void main() {
  testWidgets('Splash shows the logo, then moves on to onboarding', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    bool hasImage(String asset) => find
        .byWidgetPredicate(
          (w) =>
              w is Image &&
              w.image is AssetImage &&
              (w.image as AssetImage).assetName == asset,
        )
        .evaluate()
        .isNotEmpty;

    expect(hasImage(AssetsImages.logoKhail), isTrue);

    // Splash waits 2s, then the page transition runs.
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Play, Connect, Compete'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);
  });
}
