import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/bookingHome/give_review_screen.dart';
import 'package:khel_pakistan/view/home/bookingHome/select_date_for_reschedule.dart';
import 'package:khel_pakistan/view/home/homeScreens/bookings_home.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/chat_bottom_sheet.dart';
import 'package:khel_pakistan/widgets/detail_layout.dart';
import 'package:khel_pakistan/widgets/summary_card.dart';

enum BookingHomeStatus { upcoming, ongoing, completed }

/// One of the user's bookings (from the Bookings tab). The bottom action
/// depends on the status: reschedule (upcoming) or review (completed).
class BookingHomeDetailScreen extends StatefulWidget {
  const BookingHomeDetailScreen({
    super.key,
    this.image = AssetsImages.venue1,
    this.title = 'Karachi Sports Arena',
    this.location = 'DHA Phase 6 • 2.5 km away',
    this.status = BookingHomeStatus.upcoming,
  });

  final String image;
  final String title;
  final String location;
  final BookingHomeStatus status;

  @override
  State<BookingHomeDetailScreen> createState() =>
      _BookingHomeDetailScreenState();
}

class _BookingHomeDetailScreenState extends State<BookingHomeDetailScreen> {
  bool _isFavorite = false;

  static const _gallery = [
    AssetsImages.venue1,
    AssetsImages.venue2,
    AssetsImages.tournament2,
    AssetsImages.tournament1,
  ];

  bool get _canChat => widget.status != BookingHomeStatus.completed;

  @override
  Widget build(BuildContext context) {
    final status = widget.status;
    return DetailScaffold(
      image: widget.image,
      actions: [
        HeroAction(
          icon: _isFavorite
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          onTap: () => setState(() => _isFavorite = !_isFavorite),
        ),
      ],
      floatingActionButton: _canChat
          ? FloatingActionButton(
              backgroundColor: AppColors.dark,
              shape: const CircleBorder(),
              onPressed: () =>
                  showChatBottomSheet(context, title: widget.title),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                color: AppColors.primary,
                size: 24.r,
              ),
            )
          : null,
      bottomBar: switch (status) {
        BookingHomeStatus.upcoming => BottomActionBar(
          child: AppButton(
            text: 'Reschedule Booking',
            onTap: () => Get.to(() => const SelectDateForReschedule()),
          ),
        ),
        BookingHomeStatus.completed => BottomActionBar(
          child: AppButton(
            text: 'Give Review',
            onTap: () =>
                Get.to(() => GiveReviewScreen(venueName: widget.title)),
          ),
        ),
        BookingHomeStatus.ongoing => null,
      },
      children: [
        DetailTitle(title: widget.title, subtitle: widget.location),
        14.verticalSpace,
        Center(child: StatusChip(status: status)),
        18.verticalSpace,
        const SummaryCard(
          title: 'Your Booking',
          subtitle: 'Booking ID: KP-247891',
          rows: [
            ('Date', 'Friday, 18 July'),
            ('Time', '7:00 PM — 9:00 PM'),
            ('Players', '8'),
            ('Paid', 'Rs. 4,100'),
          ],
        ),
        const RatingSummary(),
        const DetailSection(
          title: 'Gallery',
          child: GalleryGrid(images: _gallery),
        ),
        const DetailSection(
          title: 'Amenities',
          child: ChipWrap(
            items: ['Parking', 'Locker', 'Cafe', 'Washroom'],
            icons: amenityIcons,
          ),
        ),
        DetailSection(
          title: "Where you'll be",
          child: MapPreview(location: widget.location),
        ),
        // Room for the chat button so it doesn't cover the map.
        if (_canChat) 60.verticalSpace,
      ],
    );
  }
}
