import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/models/venue.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_theme.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:flutter/services.dart';
import 'package:khel_pakistan/widgets/page_header.dart';
import 'package:khel_pakistan/widgets/venue_card.dart';

/// The user's saved venues. Shown as the "Saved" tab and also pushed from
/// Account → Favorites Venues.
class FavoritesVenueScreen extends StatelessWidget {
  const FavoritesVenueScreen({super.key, this.showBack = true});

  /// false when shown as the "Saved" tab in the bottom nav.
  final bool showBack;

  static const _venues = [
    Venue(
      image: AssetsImages.venue1,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      price: 'From PKR 4,000',
      promo: '30% off this Friday night',
    ),
    Venue(
      image: AssetsImages.venue2,
      name: 'Legends Padel Club',
      rating: '4.6',
      location: 'Clifton • 4.1 km away',
      price: 'From PKR 3,500',
    ),
    Venue(
      image: AssetsImages.venue1,
      name: 'Arena 51 Football',
      rating: '4.7',
      location: 'Gulshan • 6.0 km away',
      price: 'From PKR 5,000',
      promo: 'Weekend deal',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: AppTheme.systemOverlay,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          bottom: false,
          child: Column(
            children: [
              PageHeader(title: 'Saved Venues', showBack: showBack),
              12.verticalSpace,
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(
                    16.w,
                    4.h,
                    16.w,
                    MediaQuery.paddingOf(context).bottom + 20.h,
                  ),
                  itemCount: _venues.length,
                  separatorBuilder: (_, __) => 20.verticalSpace,
                  itemBuilder: (_, i) => VenueCard(
                    venue: _venues[i],
                    imageHeight: 180.h,
                    saved: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
