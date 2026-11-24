import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/bookings/select_date_for_booking.dart';
import 'package:khel_pakistan/widgets/detail_layout.dart';

/// Venue detail (from Home, Saved, Search). Leads into the booking flow.
class BookingsDetailScreen extends StatefulWidget {
  const BookingsDetailScreen({
    super.key,
    this.image = AssetsImages.venue1,
    this.title = 'Karachi Sports Arena',
    this.location = 'DHA Phase 6 • 2.5 km away',
  });

  final String image;
  final String title;
  final String location;

  @override
  State<BookingsDetailScreen> createState() => _BookingsDetailScreenState();
}

class _BookingsDetailScreenState extends State<BookingsDetailScreen> {
  bool _isFavorite = false;

  static const _gallery = [
    AssetsImages.venue1,
    AssetsImages.venue2,
    AssetsImages.tournament2,
    AssetsImages.tournament1,
  ];

  static const _amenities = [
    'Parking',
    'Locker',
    'Cafe',
    'Washroom',
    'Floodlights',
  ];

  @override
  Widget build(BuildContext context) {
    return DetailScaffold(
      image: widget.image,
      actions: [
        HeroAction(icon: Icons.ios_share_rounded, onTap: () {}),
        HeroAction(
          icon: _isFavorite
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          onTap: () => setState(() => _isFavorite = !_isFavorite),
        ),
      ],
      bottomBar: PriceBar(
        price: 'PKR 4,000',
        caption: 'For 2 hours',
        buttonText: 'Book Now',
        onTap: () => Get.to(() => const SelectDateForBooking()),
      ),
      children: [
        DetailTitle(title: widget.title, subtitle: widget.location),
        const RatingSummary(),
        const DetailParagraph(
          'A floodlit multi-sport arena with two padel courts and a 5-a-side '
          'football pitch. Equipment rental is available at the front desk, '
          'and courts are cleaned between every booking.',
        ),
        const DetailSection(
          title: 'Gallery',
          child: GalleryGrid(images: _gallery),
        ),
        const DetailSection(
          title: 'Amenities',
          child: ChipWrap(items: _amenities, icons: amenityIcons),
        ),
        DetailSection(
          title: "Where you'll be",
          child: MapPreview(location: widget.location),
        ),
      ],
    );
  }
}
