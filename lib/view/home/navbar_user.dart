import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_theme.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/view/home/account/favorites_venue_screen.dart';
import 'package:khel_pakistan/view/home/app_bottom_nav_bar.dart';
import 'package:khel_pakistan/view/home/homeScreens/account_home.dart';
import 'package:khel_pakistan/view/home/homeScreens/bookings_home.dart';
import 'package:khel_pakistan/view/home/homeScreens/home_screen.dart';

/// Main shell after login: the four tabs plus the floating bottom nav.
class NavbarUser extends StatelessWidget {
  const NavbarUser({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavControllerUser>(
      init: BottomNavControllerUser(),
      builder: (controller) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: AppTheme.systemOverlay,
          child: Scaffold(
            backgroundColor: AppColors.background,
            // Tabs draw under the floating nav; they pad by
            // MediaQuery.paddingOf(context).bottom.
            extendBody: true,
            body: IndexedStack(
              index: controller.currentIndex,
              children: controller.pages,
            ),
            bottomNavigationBar: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(top: 6.h, bottom: 10.h),
                child: AppBottomNavBar(
                  currentIndex: controller.currentIndex,
                  items: controller.navItems,
                  onTap: controller.selectTab,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class BottomNavControllerUser extends GetxController {
  int currentIndex = 0;

  final List<AppBottomNavItem> navItems = const [
    AppBottomNavItem(
      label: 'Home',
      icon: AssetsIcons.homeD,
      activeIcon: AssetsIcons.navHomeActive,
      tintActive: false,
    ),
    AppBottomNavItem(
      label: 'Bookings',
      icon: AssetsIcons.navBookings,
      activeIcon: AssetsIcons.navBookings,
    ),
    AppBottomNavItem(
      label: 'Saved',
      icon: AssetsIcons.navSaved,
      activeIcon: AssetsIcons.navSaved,
    ),
    AppBottomNavItem(
      label: 'Account',
      icon: AssetsIcons.navAccount,
      activeIcon: AssetsIcons.navAccount,
    ),
  ];

  final List<Widget> pages = const [
    HomeScreen(),
    BookingsHome(),
    FavoritesVenueScreen(showBack: false),
    AccountHome(),
  ];

  void selectTab(int index) {
    currentIndex = index;
    update();
  }
}
