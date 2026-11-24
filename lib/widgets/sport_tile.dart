import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';

/// The sports a player can pick (profile setup, game preferences).
const sportOptions = [
  ('Paddle', AssetsImages.sportPaddle),
  ('Football', AssetsImages.sportFootball),
  ('Cricket', AssetsImages.sportCricket),
  ('Basketball', AssetsImages.sportBasketball),
  ('Tennis', AssetsImages.sportTennis),
  ('Badminton', AssetsImages.sportBadminton),
];

/// Grey tile with a 3D sport image and name; dark border + lime tick when
/// selected.
class SportTile extends StatelessWidget {
  const SportTile({
    super.key,
    required this.name,
    required this.image,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final String image;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.all(12.r),
        decoration: BoxDecoration(
          color: AppColors.inputFill,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: selected ? AppColors.dark : AppColors.border,
            width: selected ? 1.5 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Image.asset(image, fit: BoxFit.contain),
                  ),
                ),
                8.verticalSpace,
                Text(
                  name,
                  style: AppTextStyles.subtitle.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            if (selected)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 22.r,
                  height: 22.r,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 14.r,
                    color: AppColors.onPrimary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
