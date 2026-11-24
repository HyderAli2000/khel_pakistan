import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/auth/login.dart';
import 'package:khel_pakistan/view/home/account/change_password_screen.dart';
import 'package:khel_pakistan/view/home/account/edit_profile_screen.dart';
import 'package:khel_pakistan/view/home/account/favorites_venue_screen.dart';
import 'package:khel_pakistan/view/home/account/profile_screen.dart';
import 'package:khel_pakistan/view/home/account/tournament_history_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_card.dart';
import 'package:khel_pakistan/widgets/game_preferences_dialog.dart';
import 'package:khel_pakistan/widgets/page_header.dart';
import 'package:khel_pakistan/widgets/promo_banner.dart';

class AccountHome extends StatelessWidget {
  const AccountHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          const PageHeader(title: 'Account'),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                16.w,
                12.h,
                16.w,
                MediaQuery.paddingOf(context).bottom + 24.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _ProfileCard(),
                  20.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: _QuickLinkCard(
                          icon: Icons.emoji_events_outlined,
                          label: 'Tournament\nHistory',
                          onTap: () =>
                              Get.to(() => const TournamentHistoryScreen()),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: _QuickLinkCard(
                          icon: Icons.favorite_border_rounded,
                          label: 'Favorite\nVenues',
                          onTap: () =>
                              Get.to(() => const FavoritesVenueScreen()),
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: _QuickLinkCard(
                          icon: Icons.sports_soccer_rounded,
                          label: 'Game\nPreferences',
                          onTap: () => showGamePreferencesDialog(context),
                        ),
                      ),
                    ],
                  ),
                  24.verticalSpace,
                  const PromoBanner(),
                  24.verticalSpace,
                  const _SectionTitle('Account'),
                  _SettingsGroup(
                    items: [
                      _SettingsItem(
                        icon: Icons.person_outline_rounded,
                        title: 'Edit Profile',
                        subtitle: 'Update your name, phone and city',
                        onTap: () => Get.to(() => const EditProfileScreen()),
                      ),
                      _SettingsItem(
                        icon: Icons.lock_outline_rounded,
                        title: 'Change Password',
                        subtitle: 'Update your password',
                        onTap: () => Get.to(() => const ChangePasswordScreen()),
                      ),
                    ],
                  ),
                  20.verticalSpace,
                  const _SectionTitle('Payments'),
                  const _SettingsGroup(
                    items: [
                      _SettingsItem(
                        icon: Icons.credit_card_rounded,
                        title: 'Payment Methods',
                        subtitle: 'Manage your cards and wallets',
                      ),
                      _SettingsItem(
                        icon: Icons.receipt_long_outlined,
                        title: 'Transaction History',
                        subtitle: 'View your past payments',
                      ),
                    ],
                  ),
                  28.verticalSpace,
                  AppButton(
                    text: 'Logout',
                    gradientColors: const [AppColors.dark],
                    icon: Icon(
                      Icons.logout_rounded,
                      color: AppColors.primary,
                      size: 20.r,
                    ),
                    onTap: () => Get.offAll(() => const LoginScreen()),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: () => Get.to(() => const ProfileScreen()),
      padding: EdgeInsets.all(14.r),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(2.r),
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 28.r,
              backgroundImage: const AssetImage(AssetsImages.avatarUser),
            ),
          ),
          14.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Ahmed Khan', style: AppTextStyles.title),
                4.verticalSpace,
                Text('Intermediate · Karachi', style: AppTextStyles.caption),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: AppColors.card,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Text(
              'View Profile',
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4.w, bottom: 10.h),
      child: Text(
        text,
        style: AppTextStyles.title.copyWith(
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
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
    return AppCard(
      onTap: onTap,
      padding: EdgeInsets.all(12.r),
      child: SizedBox(
        height: 84.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 36.r,
              height: 36.r,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.onPrimary, size: 20.r),
            ),
            const Spacer(),
            Text(
              label,
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimary,
                height: 1.25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingsItem {
  const _SettingsItem({
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

  final List<_SettingsItem> items;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          for (var i = 0; i < items.length; i++) ...[
            InkWell(
              onTap: items[i].onTap,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                child: Row(
                  children: [
                    Container(
                      width: 40.r,
                      height: 40.r,
                      decoration: const BoxDecoration(
                        color: AppColors.card,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        items[i].icon,
                        color: AppColors.textPrimary,
                        size: 20.r,
                      ),
                    ),
                    12.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items[i].title,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          2.verticalSpace,
                          Text(items[i].subtitle, style: AppTextStyles.caption),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.textHint,
                      size: 22.r,
                    ),
                  ],
                ),
              ),
            ),
            if (i != items.length - 1)
              Divider(height: 1, indent: 66.w, endIndent: 14.w),
          ],
        ],
      ),
    );
  }
}
