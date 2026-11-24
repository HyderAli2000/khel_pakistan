import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/models/venue.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/venue_card.dart';

/// Search venues / sports. Opened from the home search bar.
class SearchHome extends StatefulWidget {
  const SearchHome({super.key});

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  static const _venues = [
    Venue(
      image: AssetsImages.venue2,
      name: 'Legends Padel Club',
      rating: '4.6',
      location: 'Clifton • 4.1 km away',
      price: 'From PKR 3,500',
    ),
    Venue(
      image: AssetsImages.venue1,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      price: 'From PKR 4,000',
    ),
  ];

  final List<String> _recentSearches = [
    'paddle court',
    'cricket indoor',
    'football ground',
    'legends arena',
  ];

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Search',
      body: ListView(
        padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 24.h),
        children: [
          TextField(
            autofocus: true,
            style: AppTextStyles.input,
            cursorColor: AppColors.textPrimary,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Search venues, sports or locations',
              hintStyle: AppTextStyles.hint.copyWith(fontSize: 13.sp),
              filled: true,
              fillColor: AppColors.surface,
              isDense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 15.h),
              prefixIcon: Icon(
                Icons.search_rounded,
                size: 22.r,
                color: AppColors.textPrimary,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(999),
                borderSide: const BorderSide(color: AppColors.divider),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(999),
                borderSide: const BorderSide(color: AppColors.dark),
              ),
            ),
          ),
          24.verticalSpace,
          if (_recentSearches.isNotEmpty) ...[
            Row(
              children: [
                Expanded(child: Text('Recent Searches', style: _section)),
                GestureDetector(
                  onTap: () => setState(_recentSearches.clear),
                  child: Text(
                    'Clear all',
                    style: AppTextStyles.bodyMedium.copyWith(fontSize: 13.sp),
                  ),
                ),
              ],
            ),
            8.verticalSpace,
            for (final item in List.of(_recentSearches))
              ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                leading: Icon(
                  Icons.history_rounded,
                  color: AppColors.textSecondary,
                  size: 22.r,
                ),
                title: Text(item, style: AppTextStyles.body),
                trailing: IconButton(
                  icon: Icon(
                    Icons.close_rounded,
                    size: 20.r,
                    color: AppColors.textHint,
                  ),
                  onPressed: () => setState(() => _recentSearches.remove(item)),
                ),
              ),
            20.verticalSpace,
          ],
          Text('Popular Venues', style: _section),
          12.verticalSpace,
          for (final venue in _venues) ...[
            VenueCard(venue: venue, imageHeight: 170.h),
            20.verticalSpace,
          ],
        ],
      ),
    );
  }

  TextStyle get _section => AppTextStyles.title.copyWith(
    fontSize: 17.sp,
    fontWeight: FontWeight.w500,
  );
}
