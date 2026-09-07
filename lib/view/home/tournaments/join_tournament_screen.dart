import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_booking_summary_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class JoinTournamentScreen extends StatefulWidget {
  const JoinTournamentScreen({super.key});

  @override
  State<JoinTournamentScreen> createState() => _JoinTournamentScreenState();
}

class _JoinTournamentScreenState extends State<JoinTournamentScreen> {
  final _teamNameController = TextEditingController();
  final _captainNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emergencyPhoneController = TextEditingController();
  final _playersCountController = TextEditingController();

  final List<_TeamData> _teams = const [
    _TeamData(name: 'Karachi United', color: Color(0xFFC62828), initials: 'KU'),
    _TeamData(name: 'Karachi City', color: Color(0xFF1565C0), initials: 'KC'),
    _TeamData(name: 'FCK', color: Color(0xFFF9A825), initials: 'FCK'),
    _TeamData(name: 'Karachi City', color: Color(0xFF1565C0), initials: 'KC'),
    _TeamData(name: 'Karachi United', color: Color(0xFFC62828), initials: 'KU'),
  ];

  final List<String> _schedule = const [
    'Quarter Finals',
    'Semi Finals',
    'Final',
  ];

  @override
  void dispose() {
    _teamNameController.dispose();
    _captainNameController.dispose();
    _phoneController.dispose();
    _emergencyPhoneController.dispose();
    _playersCountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsImages.allBg),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.back(),
                      child: Container(
                        width: 42.w,
                        height: 42.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.white.withValues(alpha: 0.1),
                          border: Border.all(
                            color: AppColors.green.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Image.asset(
                          AssetsIcons.back,
                          width: 16.w,
                          height: 16.h,
                          color: AppColors.green,
                          errorBuilder: (_, __, ___) => Icon(
                            Icons.arrow_back_ios_new,
                            color: AppColors.green,
                            size: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'JOIN TOURNAMENT',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 26.sp,
                          fontFamily: AppFonts.rocket,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                    SizedBox(width: 42.w),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 20.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _LabeledField(
                        label: 'Team Name',
                        hint: 'Enter Team Name',
                        controller: _teamNameController,
                      ),
                      14.verticalSpace,
                      _LabeledField(
                        label: 'Captain Name',
                        hint: 'Enter Captain Name',
                        controller: _captainNameController,
                      ),
                      14.verticalSpace,
                      _LabeledField(
                        label: 'Phone Number',
                        hint: 'Enter Phone Number',
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                      ),
                      14.verticalSpace,
                      _LabeledField(
                        label: 'Emergency Phone Number',
                        hint: 'Enter Emergency Phone Number',
                        controller: _emergencyPhoneController,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(11),
                        ],
                      ),
                      14.verticalSpace,
                      _LabeledField(
                        label: 'Players Count',
                        hint: 'Enter Players Count',
                        controller: _playersCountController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(2),
                        ],
                      ),
                      22.verticalSpace,
                      Text(
                        'Participating Teams',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      12.verticalSpace,
                      SizedBox(
                        height: 110.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: _teams.length,
                          separatorBuilder: (_, __) => 10.horizontalSpace,
                          itemBuilder: (context, index) {
                            final team = _teams[index];
                            return Container(
                              width: 100.w,
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 12.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFF23243A),
                                borderRadius: BorderRadius.circular(14.r),
                                border: Border.all(
                                  color: AppColors.green.withValues(
                                    alpha: 0.25,
                                  ),
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 44.w,
                                    height: 44.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: team.color,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      team.initials,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontFamily: AppFonts.satoshi,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ),
                                  8.verticalSpace,
                                  Text(
                                    team.name,
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: AppFonts.satoshi,
                                      color: AppColors.white.withValues(
                                        alpha: 0.65,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      22.verticalSpace,
                      Text(
                        'Schedule Preview',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      12.verticalSpace,
                      ..._schedule.map(
                        (item) => Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontFamily: AppFonts.satoshi,
                              color: AppColors.white.withValues(alpha: 0.65),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 8.h, 20.w, 16.h),
                child: AppButton(
                  text: 'Join Now',
                  gradientColors: const [AppColors.green],
                  textColor: AppColors.black,
                  onTap: () =>
                      Get.to(() => const TournamentBookingSummaryScreen()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LabeledField extends StatelessWidget {
  const _LabeledField({
    required this.label,
    required this.hint,
    required this.controller,
    this.keyboardType,
    this.inputFormatters,
  });

  final String label;
  final String hint;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: AppFonts.satoshi,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        15.verticalSpace,
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          style: TextStyle(
            fontSize: 15.sp,
            fontFamily: AppFonts.satoshi,
            color: AppColors.white,
          ),
          cursorColor: AppColors.green,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontFamily: AppFonts.satoshi,
              color: AppColors.white.withValues(alpha: 0.45),
            ),
            filled: true,
            fillColor: const Color(0xFF23283A).withValues(alpha: 0.9),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 16.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(99999.r),
              borderSide: BorderSide(
                color: AppColors.white.withValues(alpha: 0.08),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(99999.r),
              borderSide: const BorderSide(color: AppColors.green),
            ),
          ),
        ),
      ],
    );
  }
}

class _TeamData {
  const _TeamData({
    required this.name,
    required this.color,
    required this.initials,
  });

  final String name;
  final Color color;
  final String initials;
}
