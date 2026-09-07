import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/account/change_password_screen.dart';
import 'package:khel_pakistan/view/home/account/edit_profile_screen.dart';
import 'package:khel_pakistan/view/home/account/favorites_venue_screen.dart';
import 'package:khel_pakistan/view/home/account/profile_screen.dart';
import 'package:khel_pakistan/view/home/account/tournament_history_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/game_preferences_dialog.dart';

class AccountHome extends StatefulWidget {
  const AccountHome({super.key});

  @override
  State<AccountHome> createState() => _AccountHomeState();
}

class _AccountHomeState extends State<AccountHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xff1B1C2D),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(16.w, 18.h, 16.w, 24.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _AccountPromoBanner(),
            16.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: _QuickLinkCard(
                    icon: Icons.history,
                    label: 'Tournament\nHistory',
                    onTap: () => Get.to(() => const TournamentHistoryScreen()),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: _QuickLinkCard(
                    icon: Icons.favorite_border,
                    label: 'Favorites\nVenues',
                    onTap: () => Get.to(() => const FavoritesVenueScreen()),
                  ),
                ),
                10.horizontalSpace,
                Expanded(
                  child: _QuickLinkCard(
                    icon: Icons.sports_basketball_outlined,
                    label: 'Game\nPreferences',
                    onTap: () => showGamePreferencesDialog(context),
                  ),
                ),
              ],
            ),
            22.verticalSpace,
            Text(
              'Account',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: AppFonts.satoshi,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            10.verticalSpace,
            _SettingsGroup(
              items: [
                _SettingsItemData(
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
                  subtitle: 'Update your profile.',
                  onTap: () => Get.to(() => const EditProfileScreen()),
                ),
                _SettingsItemData(
                  icon: Icons.lock_outline,
                  title: 'Change Password',
                  subtitle: 'Update your password.',
                  onTap: () => Get.to(() => const ChangePasswordScreen()),
                ),
              ],
            ),
            22.verticalSpace,
            Text(
              'Payments',
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: AppFonts.satoshi,
                fontWeight: FontWeight.w700,
                color: AppColors.white,
              ),
            ),
            10.verticalSpace,
            _SettingsGroup(
              items: const [
                _SettingsItemData(
                  icon: Icons.payments_outlined,
                  title: 'Payment Methods',
                  subtitle: 'Manage your payment methods.',
                ),
                _SettingsItemData(
                  icon: Icons.receipt_long_outlined,
                  title: 'Transaction History',
                  subtitle: 'View your past transactions.',
                ),
              ],
            ),
            28.verticalSpace,
            AppButton(
              text: 'Logout',
              gradientColors: const [AppColors.green],
              textColor: AppColors.black,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountPromoBanner extends StatelessWidget {
  const _AccountPromoBanner();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 100.h,
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(16.w, 0, 12.w, 0),
          decoration: BoxDecoration(
            color: AppColors.orange,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
        ),
        Positioned(
          left: -6.w,
          top: -18.h,
          child: Row(
            children: [
              Image.asset(AssetsImages.badminton, width: 120.w, height: 120.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ENJOY YOUR\nWEEKEND!',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: AppFonts.rocket,
                      color: AppColors.green,
                      height: 1.05,
                    ),
                  ),
                  4.verticalSpace,
                  Text(
                    'Upto 25% off',
                    style: TextStyle(
                      fontSize: 13.sp,
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

class _QuickLinkCard extends StatelessWidget {
  const _QuickLinkCard({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100.h,
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFF23243A),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: AppColors.white.withValues(alpha: 0.06)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: AppColors.green, size: 26.sp),
            const Spacer(),
            Text(
              label,
              style: TextStyle(
                fontSize: 12.sp,
                fontFamily: AppFonts.satoshi,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
                height: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsItemData {
  const _SettingsItemData({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.items});

  final List<_SettingsItemData> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: const Color(0xFF23243A),
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.white.withValues(alpha: 0.06)),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final item = items[index];
          return Column(
            children: [
              InkWell(
                onTap: item.onTap,
                borderRadius: BorderRadius.circular(12.r),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Row(
                    children: [
                      Container(
                        width: 42.w,
                        height: 42.w,
                        decoration: const BoxDecoration(
                          color: AppColors.orange,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          item.icon,
                          color: AppColors.white,
                          size: 22.sp,
                        ),
                      ),
                      12.horizontalSpace,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: AppFonts.satoshi,
                                fontWeight: FontWeight.w700,
                                color: AppColors.white,
                              ),
                            ),
                            2.verticalSpace,
                            Text(
                              item.subtitle,
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: AppFonts.satoshi,
                                color: AppColors.white.withValues(alpha: 0.55),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (index != items.length - 1)
                Divider(
                  height: 1,
                  color: AppColors.white.withValues(alpha: 0.08),
                ),
            ],
          );
        }),
      ),
    );
  }
}
