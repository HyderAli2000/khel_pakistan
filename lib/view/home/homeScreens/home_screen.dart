import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/bookings/bookings_detail_screen.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_detail_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _events = const [
    AssetsImages.event1,
    AssetsImages.event2,
    AssetsImages.event3,
    AssetsImages.event4,
    AssetsImages.event5,
    AssetsImages.event6,
  ];

  final List<_VenueData> _bookAgainVenues = const [
    _VenueData(
      image: AssetsImages.booking1,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      price: 'From • PKR 4000',
      promo: '30% off on this Friday Night',
    ),
    _VenueData(
      image: AssetsImages.booking2,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      price: 'From • PKR 4000',
      promo: '30% off on this Friday Night',
    ),
  ];

  final List<_VenueData> _availableVenues = const [
    _VenueData(
      image: AssetsImages.event3,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      price: 'From • PKR 4000',
    ),
    _VenueData(
      image: AssetsImages.event4,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      price: 'From • PKR 4000',
    ),
    _VenueData(
      image: AssetsImages.booking2,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      price: 'From • PKR 4000',
    ),
  ];

  bool _showPromo = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xff1B1C2D),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.r),
                topRight: Radius.circular(16.r),
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  15.verticalSpace,
                  _SectionHeader(
                    title: 'UPCOMING EVENTS',
                    trailing: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  _UpcomingEventsList(events: _events),
                  15.verticalSpace,
                  const _SectionHeader(title: 'BOOK AGAIN'),
                  10.verticalSpace,
                  _VenueCardsList(venues: _bookAgainVenues, showPromoTag: true),
                  20.verticalSpace,
                  _SectionHeader(
                    title: 'AVAILABLE VENUE',
                    trailing: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  _VenueCardsList(
                    venues: _availableVenues,
                    showPromoTag: false,
                  ),
                  20.verticalSpace,
                  _SectionHeader(
                    title: 'UPCOMING TOURNAMENT',
                    trailing: GestureDetector(
                      onTap: () {},
                      child: Text(
                        'View All',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  const _TournamentFeatureCard(
                    image: AssetsImages.event1,
                    title: 'LOREM IPSUM',
                    date: 'July 15, 2026',
                    location: 'DHA Phase 6 • 2.5 km away',
                    startIn: 'Start in 4 days',
                  ),
                  12.verticalSpace,
                  const _TournamentFeatureCard(
                    image: AssetsImages.event2,
                    title: 'LOREM IPSUM',
                    date: 'July 15, 2026',
                    location: 'DHA Phase 6 • 2.5 km away',
                    startIn: 'Start in 4 days',
                  ),
                  24.verticalSpace,
                ],
              ),
            ),
          ),
        ),
        if (_showPromo) ...[
          24.verticalSpace,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: _PromoBanner(
              onClose: () => setState(() => _showPromo = false),
            ),
          ),
        ],
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title, this.trailing});

  final String title;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24.sp,
            fontFamily: AppFonts.rocket,
            fontWeight: FontWeight.w400,
            color: AppColors.green,
          ),
        ),
        if (trailing != null) trailing!,
      ],
    );
  }
}

class _UpcomingEventsList extends StatelessWidget {
  const _UpcomingEventsList({required this.events});

  final List<String> events;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220.h,
      decoration: BoxDecoration(
        color: AppColors.orange,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
        itemCount: events.length,
        separatorBuilder: (_, __) => 12.horizontalSpace,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(14.r),
            child: Image.asset(
              events[index],
              width: 130.w,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class _VenueData {
  const _VenueData({
    required this.image,
    required this.name,
    required this.rating,
    required this.location,
    required this.price,
    this.promo,
  });

  final String image;
  final String name;
  final String rating;
  final String location;
  final String price;
  final String? promo;
}

class _VenueCardsList extends StatelessWidget {
  const _VenueCardsList({required this.venues, this.showPromoTag = false});

  final List<_VenueData> venues;
  final bool showPromoTag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: showPromoTag ? 250.h : 230.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: venues.length,
        separatorBuilder: (_, __) => 12.horizontalSpace,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(
                () => BookingsDetailScreen(
                  image: venues[index].image,
                  title: venues[index].name,
                ),
              );
            },
            child: _VenueCard(venue: venues[index], showPromoTag: showPromoTag),
          );
        },
      ),
    );
  }
}

class _VenueCard extends StatelessWidget {
  const _VenueCard({required this.venue, this.showPromoTag = false});

  final _VenueData venue;
  final bool showPromoTag;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                  border: Border.all(
                    color: AppColors.green.withValues(alpha: 0.35),
                    width: 1,
                  ),
                ),
                child: Image.asset(
                  venue.image,
                  width: 280.w,
                  height: 150.h,
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
          Row(
            children: [
              Expanded(
                child: Text(
                  venue.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontFamily: AppFonts.satoshi,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
              Icon(Icons.star, color: const Color(0xFFFFC107), size: 14.sp),
              4.horizontalSpace,
              Text(
                venue.rating,
                style: TextStyle(
                  fontSize: 13.sp,
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
          6.verticalSpace,
          if (showPromoTag && venue.promo != null)
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.orange,
                    borderRadius: BorderRadius.circular(999.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6.w,
                        height: 6.w,
                        decoration: const BoxDecoration(
                          color: AppColors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      6.horizontalSpace,
                      Text(
                        venue.promo!,
                        style: TextStyle(
                          fontSize: 11.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w600,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  venue.price,
                  style: TextStyle(
                    fontSize: 11.sp,
                    fontFamily: AppFonts.satoshi,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                ),
              ],
            )
          else
            Text(
              venue.price,
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

class _TournamentFeatureCard extends StatelessWidget {
  const _TournamentFeatureCard({
    required this.image,
    required this.title,
    required this.date,
    required this.location,
    required this.startIn,
  });

  final String image;
  final String title;
  final String date;
  final String location;
  final String startIn;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => TournamentDetailScreen(image: image, title: title),
      ),
      child: Container(
      width: double.infinity,
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: const Color(0xFF23243A),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              image,
              width: double.infinity,
              height: 170.h,
              fit: BoxFit.cover,
            ),
          ),
          10.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontFamily: AppFonts.rocket,
                    color: AppColors.green,
                  ),
                ),
              ),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: AppFonts.satoshi,
                  color: AppColors.white.withValues(alpha: 0.55),
                ),
              ),
            ],
          ),
          4.verticalSpace,
          Row(
            children: [
              Expanded(
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: AppFonts.satoshi,
                    color: AppColors.white.withValues(alpha: 0.55),
                  ),
                ),
              ),
              Text(
                startIn,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: AppFonts.satoshi,
                  fontWeight: FontWeight.w600,
                  color: AppColors.orange,
                ),
              ),
            ],
          ),
          12.verticalSpace,
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Prize Pool',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: AppFonts.satoshi,
                              color: AppColors.white.withValues(alpha: 0.55),
                            ),
                          ),
                          4.verticalSpace,
                          Text(
                            'PKR 50,000',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: AppFonts.satoshi,
                              fontWeight: FontWeight.w700,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  10.horizontalSpace,
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.06),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Teams',
                            style: TextStyle(
                              fontSize: 12.sp,
                              fontFamily: AppFonts.satoshi,
                              color: AppColors.white.withValues(alpha: 0.55),
                            ),
                          ),
                          4.verticalSpace,
                          Row(
                            children: [
                              Text(
                                '5/10',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: AppFonts.satoshi,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                              8.horizontalSpace,
                              SizedBox(
                                width: 54.w,
                                height: 22.h,
                                child: Stack(
                                  children: [
                                    _TeamDot(color: Colors.red, left: 0),
                                    _TeamDot(color: Colors.blue, left: 14.w),
                                    _TeamDot(color: Colors.amber, left: 28.w),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              14.verticalSpace,
              AppButton(
                text: 'Join Tournament',
                gradientColors: const [AppColors.green, Color(0xFF1AD1B0)],
                textColor: AppColors.black,
                height: 48.h,
                fontSize: 16.sp,
                onTap: () => Get.to(
                  () => TournamentDetailScreen(image: image, title: title),
                ),
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}

class _TeamDot extends StatelessWidget {
  const _TeamDot({required this.color, required this.left});

  final Color color;
  final double left;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      child: Container(
        width: 22.w,
        height: 22.w,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: const Color(0xFF23243A), width: 1.5),
        ),
      ),
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner({required this.onClose});

  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 120.h,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(16.w, 0.h, 12.w, 0.h),
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  10.verticalSpace,
                  GestureDetector(
                    onTap: onClose,
                    child: Container(
                      width: 34.w,
                      height: 34.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withValues(alpha: 0.15),
                      ),
                      child: Icon(
                        Icons.close,
                        color: AppColors.white.withValues(alpha: 0.8),
                        size: 18.sp,
                      ),
                    ),
                  ),
                  10.verticalSpace,
                  SizedBox(
                    width: 100.w,
                    child: AppButton(
                      text: 'Book Now',
                      gradientColors: const [AppColors.green],
                      textColor: AppColors.black,
                      height: 36.h,
                      fontSize: 13.sp,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          left: -10,
          top: -25,
          child: Row(
            children: [
              Image.asset(AssetsImages.badminton, width: 150.w, height: 150.h),
              12.horizontalSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ENJOY YOUR \nWEEKEND!',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: AppFonts.rocket,
                      color: AppColors.green,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Upto 25% off',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: AppFonts.satoshi,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
