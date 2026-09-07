import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';

Future<void> showGamePreferencesDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierColor: AppColors.black.withValues(alpha: 0.72),
    builder: (context) => const GamePreferencesDialog(),
  );
}

class GamePreferencesDialog extends StatefulWidget {
  const GamePreferencesDialog({super.key});

  @override
  State<GamePreferencesDialog> createState() => _GamePreferencesDialogState();
}

class _GamePreferencesDialogState extends State<GamePreferencesDialog> {
  static const List<_SportOption> _sports = [
    _SportOption(
      name: 'Paddle',
      icon: Icons.sports_tennis,
      iconColor: Color(0xFFE8E8E8),
    ),
    _SportOption(
      name: 'Football',
      icon: Icons.sports_soccer,
      iconColor: Color(0xFFF2F2F2),
    ),
    _SportOption(
      name: 'Cricket',
      icon: Icons.sports_cricket,
      iconColor: Color(0xFFE53935),
    ),
    _SportOption(
      name: 'Basketball',
      icon: Icons.sports_basketball,
      iconColor: Color(0xFFFF8A3D),
    ),
    _SportOption(
      name: 'Tennis',
      icon: Icons.sports_tennis,
      iconColor: Color(0xFFFF6BA8),
    ),
    _SportOption(
      name: 'Badminton',
      image: AssetsImages.badminton,
    ),
  ];

  final Set<String> _selected = {'Paddle'};

  void _toggle(String name) {
    setState(() {
      if (_selected.contains(name)) {
        _selected.remove(name);
      } else {
        _selected.add(name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 28.w, vertical: 40.h),
      child: Container(
        constraints: BoxConstraints(maxHeight: 0.78.sh),
        padding: EdgeInsets.fromLTRB(14.w, 18.h, 14.w, 18.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF24353A),
              Color(0xFF1B1C2D),
              Color(0xFF16171F),
            ],
          ),
          border: Border.all(
            color: AppColors.white.withValues(alpha: 0.08),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 36.w),
                  child: Text(
                    'GAME PREFERENCES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontFamily: AppFonts.rocket,
                      color: AppColors.green,
                      height: 1.1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 32.w,
                      height: 32.w,
                      decoration: BoxDecoration(
                        color: AppColors.white.withValues(alpha: 0.12),
                        shape: BoxShape.circle,
                      ),
                      padding: EdgeInsets.all(8.w),
                      child: Image.asset(
                        AssetsIcons.cancel,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            18.verticalSpace,
            Flexible(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: _sports.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.w,
                  mainAxisSpacing: 12.h,
                  childAspectRatio: 0.92,
                ),
                itemBuilder: (context, index) {
                  final sport = _sports[index];
                  final selected = _selected.contains(sport.name);
                  return _SportCard(
                    sport: sport,
                    selected: selected,
                    onTap: () => _toggle(sport.name),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SportOption {
  const _SportOption({
    required this.name,
    this.icon,
    this.iconColor,
    this.image,
  });

  final String name;
  final IconData? icon;
  final Color? iconColor;
  final String? image;
}

class _SportCard extends StatelessWidget {
  const _SportCard({
    required this.sport,
    required this.selected,
    required this.onTap,
  });

  final _SportOption sport;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: EdgeInsets.fromLTRB(10.w, 14.h, 10.w, 12.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1E1F2E),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: selected
                ? AppColors.green
                : AppColors.white.withValues(alpha: 0.08),
            width: selected ? 1.6 : 1,
          ),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: AppColors.green.withValues(alpha: 0.22),
                    blurRadius: 10,
                    spreadRadius: 0.5,
                  ),
                ]
              : null,
        ),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: sport.image != null
                    ? Image.asset(
                        sport.image!,
                        width: 78.w,
                        height: 78.w,
                        fit: BoxFit.contain,
                      )
                    : Icon(
                        sport.icon,
                        size: 64.sp,
                        color: sport.iconColor ?? AppColors.white,
                      ),
              ),
            ),
            8.verticalSpace,
            Text(
              sport.name,
              style: TextStyle(
                fontSize: 14.sp,
                fontFamily: AppFonts.satoshi,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
