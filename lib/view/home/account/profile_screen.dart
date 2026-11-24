import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/account/edit_profile_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_card.dart';
import 'package:khel_pakistan/widgets/app_page.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Profile',
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(3.r),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 52.r,
                backgroundImage: const AssetImage(AssetsImages.avatarUser),
              ),
            ),
            14.verticalSpace,
            Text('Ahmed Khan', style: AppTextStyles.h1),
            4.verticalSpace,
            Text('Player since July 2026', style: AppTextStyles.caption),
            20.verticalSpace,
            const Row(
              children: [
                Expanded(
                  child: _StatTile(value: '24', label: 'Bookings'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _StatTile(value: '5', label: 'Tournaments'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _StatTile(value: 'Inter.', label: 'Skill'),
                ),
              ],
            ),
            24.verticalSpace,
            const _ProfileField(
              icon: Icons.mail_outline_rounded,
              label: 'Email Address',
              value: 'ahmed.khan@example.com',
              verified: true,
            ),
            12.verticalSpace,
            const _ProfileField(
              icon: Icons.phone_outlined,
              label: 'Phone (WhatsApp)',
              value: '+92 333 456 7890',
              verified: true,
            ),
            12.verticalSpace,
            const _ProfileField(
              icon: Icons.location_on_outlined,
              label: 'City',
              value: 'Karachi, Pakistan',
            ),
          ],
        ),
      ),
      bottom: AppButton(
        text: 'Edit Profile',
        onTap: () => Get.to(() => const EditProfileScreen()),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  const _StatTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(vertical: 14.h),
      child: Column(
        children: [
          Text(value, style: AppTextStyles.title),
          2.verticalSpace,
          Text(label, style: AppTextStyles.caption),
        ],
      ),
    );
  }
}

class _ProfileField extends StatelessWidget {
  const _ProfileField({
    required this.icon,
    required this.label,
    required this.value,
    this.verified = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool verified;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 40.r,
            height: 40.r,
            decoration: const BoxDecoration(
              color: AppColors.card,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 20.r, color: AppColors.textPrimary),
          ),
          12.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.caption.copyWith(color: AppColors.label),
                ),
                2.verticalSpace,
                Text(
                  value,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (verified)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.verified_rounded,
                    size: 13.r,
                    color: AppColors.onPrimary,
                  ),
                  4.horizontalSpace,
                  Text(
                    'Verified',
                    style: AppTextStyles.caption.copyWith(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
