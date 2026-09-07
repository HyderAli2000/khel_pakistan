import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/account/profile_screen.dart';
import 'package:khel_pakistan/view/home/app_bottom_nav_bar.dart';
import 'package:khel_pakistan/view/home/homeScreens/account_home.dart';
import 'package:khel_pakistan/view/home/homeScreens/bookings_home.dart';
import 'package:khel_pakistan/view/home/homeScreens/home_screen.dart';
import 'package:khel_pakistan/view/home/homeScreens/search_home.dart';
import 'package:khel_pakistan/utils/assets_images.dart';

class NavbarUser extends StatefulWidget {
  const NavbarUser({super.key});

  @override
  State<NavbarUser> createState() => _NavbarUserState();
}

class _NavbarUserState extends State<NavbarUser> {
  final BottomNavControllerUser _controller = Get.put(
    BottomNavControllerUser(),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavControllerUser>(
      init: _controller,
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.light,
          ),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AssetsImages.homeBg),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: controller.currentIndex == 2
                  ? null
                  : PreferredSize(
                      preferredSize: Size.fromHeight(
                        controller.currentIndex == 0 ? 130.h : 72.h,
                      ),
                      child: HomeAppHeader(
                        showSearch: controller.currentIndex == 0,
                      ),
                    ),
              body: controller.pages[controller.currentIndex],
              bottomNavigationBar: SafeArea(
                top: false,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  child: AppBottomNavBar(
                    currentIndex: controller.currentIndex,
                    items: controller.navItems,
                    onTap: controller.selectTab,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class HomeAppHeader extends StatelessWidget {
  const HomeAppHeader({super.key, this.showSearch = true});

  final bool showSearch;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 8.h),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(() => const ProfileScreen());
              },
              child: Row(
                children: [
                  Container(
                    width: 48.w,
                    height: 48.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.green, width: 1.5),
                      color: AppColors.white.withValues(alpha: 0.12),
                    ),
                    child: ClipOval(
                      child: Image.asset(AssetsImages.p1, fit: BoxFit.cover),
                    ),
                  ),
                  12.horizontalSpace,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ALEX MURPHY',
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontFamily: AppFonts.rocket,
                            fontWeight: FontWeight.w400,
                            color: AppColors.green,
                            height: 1,
                          ),
                        ),
                        4.verticalSpace,
                        Text(
                          'Ready for your next game?',
                          style: TextStyle(
                            fontSize: 13.sp,
                            fontFamily: AppFonts.satoshi,
                            fontWeight: FontWeight.w400,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 44.w,
                      height: 44.w,
                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.white.withValues(alpha: 0.12),
                        border: Border.all(
                          color: AppColors.green.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Image.asset(
                        AssetsIcons.noti,
                        fit: BoxFit.contain,
                        color: AppColors.green,
                        errorBuilder: (_, __, ___) => Icon(
                          Icons.notifications_none_rounded,
                          color: AppColors.green,
                          size: 22.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (showSearch) ...[
              14.verticalSpace,
              Container(
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
                      child: Text(
                        'Search Venue or Sports',
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: AppFonts.satoshi,
                          color: AppColors.white.withValues(alpha: 0.55),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  const CircleIconButton({required this.icon, required this.onTap});

  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Container(
          padding: EdgeInsets.all(10.w),
          clipBehavior: Clip.antiAlias,
          width: 44.w,
          height: 44.w,
          decoration: BoxDecoration(
            color: Color(0xFF5D569E).withValues(alpha: 0.1),
            border: Border.all(color: Color(0xFF672D93).withValues(alpha: 0.1)),
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            icon,
            width: 24.w,
            height: 24.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class BottomNavControllerUser extends GetxController {
  int currentIndex = 0;
  int resourcesTabIndex = 0;

  final List<AppBottomNavItem> navItems = const [
    AppBottomNavItem(
      label: 'Home',
      icon: AssetsIcons.homeD,
      activeIcon: AssetsIcons.homeD,
    ),
    AppBottomNavItem(
      label: 'Bookings',
      icon: AssetsIcons.calD,
      activeIcon: AssetsIcons.calD,
    ),
    AppBottomNavItem(
      label: 'Search',
      icon: AssetsIcons.searchD,
      activeIcon: AssetsIcons.searchD,
    ),
    AppBottomNavItem(
      label: 'Account',
      icon: AssetsIcons.profileD,
      activeIcon: AssetsIcons.profileD,
    ),
  ];

  List<Widget> get pages => [
    const HomeScreen(),
    const BookingsHome(),
    const SearchHome(),
    const AccountHome(),
  ];

  final List<String> titles = const ['Home', 'Bookings', 'Search', 'Account'];

  String get currentTitle => titles[currentIndex];

  void selectTab(int index) {
    if (index == 1 && currentIndex != 1) {
      resourcesTabIndex = 0;
    }
    currentIndex = index;
    update();
  }

  void openResourcesAt(int tabIndex) {
    resourcesTabIndex = tabIndex.clamp(0, 1);
    currentIndex = 1;
    update();
  }
}
