import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/account/profile_screen.dart';
import 'package:khel_pakistan/models/venue.dart';
import 'package:khel_pakistan/view/home/homeScreens/search_home.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_detail_screen.dart';
import 'package:khel_pakistan/widgets/promo_banner.dart';
import 'package:khel_pakistan/widgets/venue_card.dart';
import 'package:khel_pakistan/widgets/app_circle_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const _categories = [
    _Category('Cricket', AssetsImages.sportCricket, 22),
    _Category('Football', AssetsImages.sportFootball, 38),
    _Category('Padel', AssetsImages.sportPaddle, 8),
    _Category('Badminton', AssetsImages.sportBadminton, 14),
    _Category('Tennis', AssetsImages.sportTennis, 6),
    _Category('Basketball', AssetsImages.sportBasketball, 5),
  ];

  static const _tournaments = [
    _Tournament(AssetsImages.tournament1, 'Global Football Fan Day'),
    _Tournament(AssetsImages.tournament2, 'Karachi Padel Open'),
  ];

  static const _bookAgain = [
    Venue(
      image: AssetsImages.venue1,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      price: 'From PKR 4,000',
    ),
    Venue(
      image: AssetsImages.venue2,
      name: 'Legends Padel Club',
      rating: '4.6',
      location: 'Clifton • 4.1 km away',
      price: 'From PKR 3,500',
    ),
  ];

  static const _available = [
    Venue(
      image: AssetsImages.venue2,
      name: 'Arena 51 Football',
      rating: '4.7',
      location: 'Gulshan • 6.0 km away',
      price: 'From PKR 5,000',
    ),
    Venue(
      image: AssetsImages.venue1,
      name: 'Karachi Sports Arena',
      rating: '4.8',
      location: 'DHA Phase 6 • 2.5 km away',
      price: 'From PKR 4,000',
    ),
  ];

  int _selectedCategory = 1;
  bool _showPromo = true;

  @override
  Widget build(BuildContext context) {
    // The nav bar floats over the body (extendBody), so this is its height.
    final navInset = MediaQuery.paddingOf(context).bottom;

    return Stack(
      children: [
        SafeArea(
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                sliver: SliverList.list(
                  children: [
                    12.verticalSpace,
                    const _HomeHeader(name: 'Ahmed', city: 'Karachi, Pakistan'),
                    18.verticalSpace,
                    _SearchBar(onTap: () => Get.to(() => const SearchHome())),
                    18.verticalSpace,
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 96.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: _categories.length,
                    separatorBuilder: (_, __) => 10.horizontalSpace,
                    itemBuilder: (_, i) => _CategoryTile(
                      category: _categories[i],
                      selected: i == _selectedCategory,
                      onTap: () => setState(() => _selectedCategory = i),
                    ),
                  ),
                ),
              ),
              _sectionTitle('Upcoming Tournaments', onViewAll: () {}),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 196.h,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    itemCount: _tournaments.length,
                    separatorBuilder: (_, __) => 12.horizontalSpace,
                    itemBuilder: (_, i) =>
                        _TournamentCard(tournament: _tournaments[i]),
                  ),
                ),
              ),
              _sectionTitle('Book Again'),
              _venueRow(_bookAgain),
              _sectionTitle('Available Venues', onViewAll: () {}),
              _venueRow(_available),
              SliverToBoxAdapter(
                child: SizedBox(height: navInset + (_showPromo ? 120.h : 20.h)),
              ),
            ],
          ),
        ),
        if (_showPromo)
          Positioned(
            left: 16.w,
            right: 16.w,
            bottom: navInset + 4.h,
            child: PromoBanner(
              onClose: () => setState(() => _showPromo = false),
            ),
          ),
      ],
    );
  }

  Widget _sectionTitle(String title, {VoidCallback? onViewAll}) {
    return SliverPadding(
      padding: EdgeInsets.fromLTRB(16.w, 22.h, 16.w, 12.h),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: AppTextStyles.title.copyWith(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (onViewAll != null)
              GestureDetector(
                onTap: onViewAll,
                child: Text(
                  'View All',
                  style: AppTextStyles.bodyMedium.copyWith(fontSize: 13.sp),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _venueRow(List<Venue> venues) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 228.h,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          itemCount: venues.length,
          separatorBuilder: (_, __) => 12.horizontalSpace,
          itemBuilder: (_, i) => VenueCard(venue: venues[i], width: 300.w),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Data (static mock data until there is a backend)

class _Category {
  const _Category(this.name, this.image, this.grounds);
  final String name;
  final String image;
  final int grounds;
}

class _Tournament {
  const _Tournament(this.image, this.title);
  final String image;
  final String title;
}

// ---------------------------------------------------------------------------
// Widgets

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.name, required this.city});

  final String name;
  final String city;

  String get _greeting {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 17) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.to(() => const ProfileScreen()),
          child: CircleAvatar(
            radius: 28.r,
            backgroundColor: AppColors.inputFill,
            backgroundImage: const AssetImage(AssetsImages.avatarUser),
          ),
        ),
        12.horizontalSpace,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _greeting,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textHint,
                ),
              ),
              2.verticalSpace,
              Text(
                'Ready to play, $name?',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.title.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              4.verticalSpace,
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 14.r,
                    color: AppColors.textSecondary,
                  ),
                  4.horizontalSpace,
                  Text(city, style: AppTextStyles.caption),
                ],
              ),
            ],
          ),
        ),
        AppCircleButton(
          icon: Icons.notifications_none_rounded,
          iconColor: AppColors.primary,
          size: 44.r,
          onTap: () {},
        ),
      ],
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.divider),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              size: 22.r,
              color: AppColors.textPrimary,
            ),
            10.horizontalSpace,
            Text(
              'Search venues, sports or locations',
              style: AppTextStyles.hint.copyWith(fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final _Category category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: 84.w,
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 4.w),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.card,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selected ? AppColors.dark : Colors.transparent,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(category.image, height: 28.r, fit: BoxFit.contain),
            8.verticalSpace,
            Text(
              category.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.textPrimary,
              ),
            ),
            2.verticalSpace,
            Text(
              '${category.grounds} grounds',
              style: AppTextStyles.caption.copyWith(fontSize: 10.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class _TournamentCard extends StatelessWidget {
  const _TournamentCard({required this.tournament});

  final _Tournament tournament;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => TournamentDetailScreen(
          image: tournament.image,
          title: tournament.title,
        ),
      ),
      child: Container(
        width: 330.w,
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.r),
          child: Image.asset(tournament.image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
