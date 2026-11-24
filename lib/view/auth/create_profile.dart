import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/auth/allow_location_access.dart';
import 'package:khel_pakistan/widgets/app_background.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_circle_button.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';
import 'package:khel_pakistan/widgets/sport_tile.dart';

/// 3-step player profile setup: personal info → city → sports.
class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  static const _stepNames = ['Personal Info', 'Your City', 'Sports'];

  final _fullNameController = TextEditingController();
  final _phoneController = TextEditingController();

  int _step = 0;
  String? _skill;
  String? _city;
  final Set<String> _sports = {};

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _next() {
    FocusScope.of(context).unfocus();
    if (_step < 2) {
      setState(() => _step++);
    } else {
      Get.off(() => const AllowLocationAccessScreen());
    }
  }

  void _back() {
    FocusScope.of(context).unfocus();
    if (_step > 0) {
      setState(() => _step--);
    } else {
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _step == 0,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _back();
      },
      child: AppBackground(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              children: [
                StepHeader(
                  current: _step + 1,
                  total: 3,
                  caption: 'Step ${_step + 1} of 3 · ${_stepNames[_step]}',
                  onBack: _back,
                ),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    // Default layout centres the step; keep it top-aligned.
                    layoutBuilder: (current, previous) => Stack(
                      alignment: Alignment.topCenter,
                      children: [...previous, ?current],
                    ),
                    child: KeyedSubtree(
                      key: ValueKey(_step),
                      child: switch (_step) {
                        0 => _personalInfoStep(),
                        1 => _cityStep(),
                        _ => _sportsStep(),
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                  child: AppButton(text: 'Continue', onTap: _next),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---- Step 1: personal info ----
  Widget _personalInfoStep() {
    const levels = ['Beginner', 'Intermediate', 'Advanced', 'Pro'];
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StepIntro(
            icon: Image.asset(AssetsImages.emojiWave, height: 56.r),
            title: 'Welcome to Khel Pakistan!',
            subtitle: "Let's set up your player profile",
          ),
          AppTextField(
            label: 'Full Name *',
            hintText: 'Enter your full name',
            controller: _fullNameController,
            prefixIconData: Icons.person_outline_rounded,
            textInputAction: TextInputAction.next,
          ),
          14.verticalSpace,
          AppTextField(
            label: 'Phone (WhatsApp)',
            hintText: '+92 3XX XXXXXXX',
            controller: _phoneController,
            prefixIconData: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
          ),
          14.verticalSpace,
          Text(
            'Skill Level',
            style: AppTextStyles.caption.copyWith(color: AppColors.label),
          ),
          8.verticalSpace,
          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: [
              for (final level in levels)
                _SkillChip(
                  label: level,
                  selected: _skill == level,
                  onTap: () => setState(() => _skill = level),
                ),
            ],
          ),
          24.verticalSpace,
        ],
      ),
    );
  }

  // ---- Step 2: city ----
  Widget _cityStep() {
    const cities = [
      ('Karachi', AssetsImages.cityKarachi),
      ('Lahore', AssetsImages.cityLahore),
      ('Islamabad', AssetsImages.cityIslamabad),
      ('Rawalpindi', AssetsImages.cityRawalpindi),
      ('Peshawar', AssetsImages.cityPeshawar),
      ('Quetta', AssetsImages.cityQuetta),
      ('Faisalabad', AssetsImages.cityFaisalabad),
      ('Multan', AssetsImages.cityMultan),
    ];
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      children: [
        StepIntro(
          icon: Icon(
            Icons.location_on,
            size: 52.r,
            color: AppColors.textPrimary,
          ),
          title: 'Where are you based?',
          subtitle: "We'll show grounds near you",
        ),
        for (final (name, icon) in cities) ...[
          _CityTile(
            name: name,
            icon: icon,
            selected: _city == name,
            onTap: () => setState(() => _city = name),
          ),
          10.verticalSpace,
        ],
        14.verticalSpace,
      ],
    );
  }

  // ---- Step 3: sports ----
  Widget _sportsStep() {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          sliver: SliverToBoxAdapter(
            child: StepIntro(
              icon: Image.asset(AssetsImages.sportFootball, height: 52.r),
              title: 'Which sports do you play?',
              subtitle: 'Select all that apply',
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.fromLTRB(28.w, 0, 28.w, 20.h),
          sliver: SliverGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 14.w,
            childAspectRatio: 0.88,
            children: [
              for (final (name, image) in sportOptions)
                SportTile(
                  name: name,
                  image: image,
                  selected: _sports.contains(name),
                  onTap: () => setState(() {
                    _sports.contains(name)
                        ? _sports.remove(name)
                        : _sports.add(name);
                  }),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Back button + segmented progress bar + "Step x of y · …" caption.
class StepHeader extends StatelessWidget {
  const StepHeader({
    super.key,
    required this.current,
    required this.total,
    required this.caption,
    this.onBack,
  });

  final int current;
  final int total;
  final String caption;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
      child: SizedBox(
        height: 52.h,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 1; i <= total; i++)
                      Container(
                        width: 52.w,
                        height: 3.h,
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        decoration: BoxDecoration(
                          color: i <= current
                              ? AppColors.dark
                              : AppColors.inputFill,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                  ],
                ),
                8.verticalSpace,
                Text(
                  caption,
                  style: AppTextStyles.caption.copyWith(
                    fontSize: 11.sp,
                    color: AppColors.label,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AppCircleButton.back(onTap: onBack),
            ),
          ],
        ),
      ),
    );
  }
}

/// Centred icon + title + subtitle at the top of each step.
class StepIntro extends StatelessWidget {
  const StepIntro({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final Widget icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h, bottom: 24.h),
      child: Center(
        child: Column(
          children: [
            icon,
            18.verticalSpace,
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyles.h1.copyWith(
                fontSize: 21.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            8.verticalSpace,
            Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.body.copyWith(fontSize: 13.sp),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkillChip extends StatelessWidget {
  const _SkillChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 9.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.dark : AppColors.primary,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Text(
          label,
          style: AppTextStyles.caption.copyWith(
            fontWeight: FontWeight.w600,
            color: selected ? AppColors.primary : AppColors.onPrimary,
          ),
        ),
      ),
    );
  }
}

class _CityTile extends StatelessWidget {
  const _CityTile({
    required this.name,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  final String name;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 48.h,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.inputFill,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
            color: selected ? AppColors.dark : AppColors.border,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 30.r,
              height: 24.r,
              child: Image.asset(icon, fit: BoxFit.contain),
            ),
            14.horizontalSpace,
            Expanded(
              child: Text(
                name,
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            if (selected)
              Icon(Icons.check_circle, size: 20.r, color: AppColors.dark),
          ],
        ),
      ),
    );
  }
}
