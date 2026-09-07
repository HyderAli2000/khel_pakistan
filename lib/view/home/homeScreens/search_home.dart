import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';

class SearchHome extends StatefulWidget {
  const SearchHome({super.key});

  @override
  State<SearchHome> createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  final List<_PopularVenue> _venues = const [
    _PopularVenue(
      image: AssetsImages.event3,
      name: 'Karachi Sports Arena',
      location: 'DHA Phase 6 • 2.5 km away',
    ),
    _PopularVenue(
      image: AssetsImages.booking2,
      name: 'Karachi Sports Arena',
      location: 'DHA Phase 6 • 2.5 km away',
    ),
    _PopularVenue(
      image: AssetsImages.booking1,
      name: 'Karachi Sports Arena',
      location: 'DHA Phase 6 • 2.5 km away',
    ),
  ];

  List<String> _recentSearches = [
    'paddle court',
    'cricket indoor',
    'football ground',
    'legends arena',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
            child: Container(
              height: 48.h,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: AppColors.white.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(999.r),
                border: Border.all(
                  color: AppColors.green.withValues(alpha: 0.45),
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: AppColors.green, size: 22.sp),
                  10.horizontalSpace,
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppFonts.satoshi,
                        color: AppColors.white,
                      ),
                      cursorColor: AppColors.green,
                      decoration: InputDecoration(
                        isDense: true,
                        border: InputBorder.none,
                        hintText: 'Search Venue or Sports',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.satoshi,
                          color: AppColors.white.withValues(alpha: 0.55),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xff1B1C2D),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.r),
                  topRight: Radius.circular(16.r),
                ),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'POPULAR SPORTS VENUE',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: AppFonts.rocket,
                        color: AppColors.green,
                      ),
                    ),
                    12.verticalSpace,
                    SizedBox(
                      height: 190.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: _venues.length,
                        separatorBuilder: (_, __) => 12.horizontalSpace,
                        itemBuilder: (context, index) {
                          return _PopularVenueCard(venue: _venues[index]);
                        },
                      ),
                    ),
                    24.verticalSpace,
                    Text(
                      'RECENT SEARCHES',
                      style: TextStyle(
                        fontSize: 24.sp,
                        fontFamily: AppFonts.rocket,
                        color: AppColors.green,
                      ),
                    ),
                    12.verticalSpace,
                    ...List.generate(_recentSearches.length, (index) {
                      final item = _recentSearches[index];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 14.h),
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              color: AppColors.white.withValues(alpha: 0.55),
                              size: 22.sp,
                            ),
                            12.horizontalSpace,
                            Expanded(
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: AppFonts.satoshi,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() => _recentSearches.removeAt(index));
                              },
                              child: Icon(
                                Icons.close,
                                color: AppColors.white.withValues(alpha: 0.55),
                                size: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PopularVenue {
  const _PopularVenue({
    required this.image,
    required this.name,
    required this.location,
  });

  final String image;
  final String name;
  final String location;
}

class _PopularVenueCard extends StatelessWidget {
  const _PopularVenueCard({required this.venue});

  final _PopularVenue venue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(14.r),
                child: Image.asset(
                  venue.image,
                  width: 220.w,
                  height: 130.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: Container(
                  width: 34.w,
                  height: 34.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withValues(alpha: 0.35),
                  ),
                  child: Icon(
                    Icons.favorite_border,
                    color: AppColors.green,
                    size: 18.sp,
                  ),
                ),
              ),
            ],
          ),
          8.verticalSpace,
          Text(
            venue.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppFonts.satoshi,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          4.verticalSpace,
          Text(
            venue.location,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12.sp,
              fontFamily: AppFonts.satoshi,
              color: AppColors.white.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}
