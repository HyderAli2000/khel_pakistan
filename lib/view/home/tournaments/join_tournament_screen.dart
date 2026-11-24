import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/view/home/tournaments/tournament_booking_summary_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_card.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';

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

  static const _teams = [
    _TeamData(name: 'Karachi United', color: Color(0xFFC62828), initials: 'KU'),
    _TeamData(name: 'Karachi City', color: Color(0xFF1565C0), initials: 'KC'),
    _TeamData(name: 'FC Karachi', color: Color(0xFFF9A825), initials: 'FCK'),
    _TeamData(name: 'Lyari Stars', color: Color(0xFF2E7D32), initials: 'LS'),
    _TeamData(name: 'Clifton Lions', color: Color(0xFF6A1B9A), initials: 'CL'),
  ];

  static const _schedule = [
    ('Quarter Finals', '18 July · 6:00 PM'),
    ('Semi Finals', '19 July · 7:00 PM'),
    ('Final', '20 July · 8:00 PM'),
  ];

  static final _phoneFormat = [
    FilteringTextInputFormatter.digitsOnly,
    LengthLimitingTextInputFormatter(11),
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
    return AppPage(
      title: 'Join Tournament',
      body: ListView(
        padding: EdgeInsets.fromLTRB(20.w, 16.h, 20.w, 20.h),
        children: [
          AppTextField(
            label: 'Team Name',
            hintText: 'Enter team name',
            controller: _teamNameController,
            prefixIconData: Icons.shield_outlined,
            textInputAction: TextInputAction.next,
          ),
          14.verticalSpace,
          AppTextField(
            label: 'Captain Name',
            hintText: 'Enter captain name',
            controller: _captainNameController,
            prefixIconData: Icons.person_outline_rounded,
            textInputAction: TextInputAction.next,
          ),
          14.verticalSpace,
          AppTextField(
            label: 'Phone Number',
            hintText: '03XX XXXXXXX',
            controller: _phoneController,
            prefixIconData: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            inputFormatters: _phoneFormat,
            textInputAction: TextInputAction.next,
          ),
          14.verticalSpace,
          AppTextField(
            label: 'Emergency Phone Number',
            hintText: '03XX XXXXXXX',
            controller: _emergencyPhoneController,
            prefixIconData: Icons.emergency_outlined,
            keyboardType: TextInputType.phone,
            inputFormatters: _phoneFormat,
            textInputAction: TextInputAction.next,
          ),
          14.verticalSpace,
          AppTextField(
            label: 'Players Count',
            hintText: 'e.g. 11',
            controller: _playersCountController,
            prefixIconData: Icons.groups_outlined,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
            ],
          ),
          24.verticalSpace,
          Text('Participating Teams', style: _section),
          12.verticalSpace,
          SizedBox(
            height: 92.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _teams.length,
              separatorBuilder: (_, __) => 14.horizontalSpace,
              itemBuilder: (_, i) {
                final team = _teams[i];
                return SizedBox(
                  width: 64.w,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 27.r,
                        backgroundColor: team.color,
                        child: Text(
                          team.initials,
                          style: AppTextStyles.caption.copyWith(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        team.name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.caption.copyWith(
                          fontSize: 10.sp,
                          color: AppColors.textPrimary,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          20.verticalSpace,
          Text('Schedule Preview', style: _section),
          12.verticalSpace,
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                for (var i = 0; i < _schedule.length; i++) ...[
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 14.h,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 28.r,
                          height: 28.r,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: i == _schedule.length - 1
                                ? AppColors.primary
                                : AppColors.card,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${i + 1}',
                            style: AppTextStyles.caption.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ),
                        12.horizontalSpace,
                        Expanded(
                          child: Text(
                            _schedule[i].$1,
                            style: AppTextStyles.bodyMedium.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Text(_schedule[i].$2, style: AppTextStyles.caption),
                      ],
                    ),
                  ),
                  if (i != _schedule.length - 1) const Divider(height: 1),
                ],
              ],
            ),
          ),
        ],
      ),
      bottom: AppButton(
        text: 'Continue',
        onTap: () => Get.to(() => const TournamentBookingSummaryScreen()),
      ),
    );
  }

  TextStyle get _section => AppTextStyles.title.copyWith(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
  );
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
