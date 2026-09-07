import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/bookings/bookings_detail_screen.dart';

class FavoritesVenueScreen extends StatelessWidget {
  const FavoritesVenueScreen({super.key});

  final List<_FavoriteVenue> _venues = const [
    _FavoriteVenue(
      image: AssetsImages.booking1,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      promo: '30% off on this Friday Night',
      price: 'From • PKR 4000',
    ),
    _FavoriteVenue(
      image: AssetsImages.booking2,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      promo: '30% off on this Friday Night',
      price: 'From • PKR 4000',
    ),
    _FavoriteVenue(
      image: AssetsImages.booking1,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      promo: '30% off on this Friday Night',
      price: 'From • PKR 4000',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.allBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 42.w,
                        height: 42.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withValues(alpha: 0.1),
                          border: Border.all(
                            color: AppColors.green.withValues(alpha: 0.45),
                          ),
                        ),
                        child: Image.asset(
                          AssetsIcons.back,
                          width: 16.w,
                          height: 16.h,
                          color: AppColors.green,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.green,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'FAVORITES VENUE',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontFamily: AppFonts.rocket,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 42.w),
                  ],
                ),
              ),
              16.verticalSpace,
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 20.h),
                  itemCount: _venues.length,
                  separatorBuilder: (_, __) => 16.verticalSpace,
                  itemBuilder: (context, index) {
                    final venue = _venues[index];
                    return GestureDetector(
                      onTap: () => Get.to(
                        () => BookingsDetailScreen(
                          image: venue.image,
                          title: venue.name,
                          location: venue.location,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.r),
                                child: Image.asset(
                                  venue.image,
                                  width: double.infinity,
                                  height: 180.h,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                top: 12.h,
                                right: 12.w,
                                child: Icon(
                                  Icons.favorite,
                                  color: AppColors.green,
                                  size: 24.sp,
                                ),
                              ),
                            ],
                          ),
                          10.verticalSpace,
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  venue.name,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: AppFonts.satoshi,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: const Color(0xFFFFC107),
                                size: 16.sp,
                              ),
                              4.horizontalSpace,
                              Text(
                                venue.rating,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: AppFonts.satoshi,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                          4.verticalSpace,
                          Text(
                            venue.location,
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: AppFonts.satoshi,
                              color: AppColors.white.withValues(alpha: 0.55),
                            ),
                          ),
                          8.verticalSpace,
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 6.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(999.r),
                                ),
                                child: Text(
                                  venue.promo,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    fontFamily: AppFonts.satoshi,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Text(
                                venue.price,
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: AppFonts.satoshi,
                                  color: AppColors.white.withValues(
                                    alpha: 0.55,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FavoriteVenue {
  const _FavoriteVenue({
    required this.image,
    required this.name,
    required this.rating,
    required this.location,
    required this.promo,
    required this.price,
  });

  final String image;
  final String name;
  final String rating;
  final String location;
  final String promo;
  final String price;
}
