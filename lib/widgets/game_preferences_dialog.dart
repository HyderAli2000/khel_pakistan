import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_circle_button.dart';
import 'package:khel_pakistan/widgets/sport_tile.dart';

Future<void> showGamePreferencesDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierColor: AppColors.dark.withValues(alpha: 0.5),
    builder: (context) => const GamePreferencesDialog(),
  );
}

class GamePreferencesDialog extends StatefulWidget {
  const GamePreferencesDialog({super.key});

  @override
  State<GamePreferencesDialog> createState() => _GamePreferencesDialogState();
}

class _GamePreferencesDialogState extends State<GamePreferencesDialog> {
  final Set<String> _selected = {'Paddle', 'Football'};

  void _toggle(String name) => setState(() {
    _selected.contains(name) ? _selected.remove(name) : _selected.add(name);
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.background,
      surfaceTintColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.r)),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 0.8.sh),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 16.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 44.r,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'Game Preferences',
                      style: AppTextStyles.h2.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: AppCircleButton.close(
                        size: 36.r,
                        onTap: () => Navigator.of(context).pop(),
                      ),
                    ),
                  ],
                ),
              ),
              4.verticalSpace,
              Text(
                'Select all the sports you play',
                style: AppTextStyles.body.copyWith(fontSize: 13.sp),
              ),
              16.verticalSpace,
              Flexible(
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 12.h,
                  crossAxisSpacing: 12.w,
                  childAspectRatio: 0.95,
                  children: [
                    for (final (name, image) in sportOptions)
                      SportTile(
                        name: name,
                        image: image,
                        selected: _selected.contains(name),
                        onTap: () => _toggle(name),
                      ),
                  ],
                ),
              ),
              16.verticalSpace,
              AppButton(
                text: 'Save Preferences',
                onTap: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
