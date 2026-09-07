import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/utils/fonts.dart';
import 'package:khel_pakistan/view/home/tournaments/join_tournament_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';

class TournamentDetailScreen extends StatefulWidget {
  const TournamentDetailScreen({
    super.key,
    this.image = AssetsImages.badminton,
    this.title = 'Karachi Champions League 2026',
    this.club = 'DHA Sports Club',
    this.sport = 'Padel',
    this.location = 'DHA Phase 6 • 2.5 km away',
    this.showJoinBar = true,
  });

  final String image;
  final String title;
  final String club;
  final String sport;
  final String location;
  final bool showJoinBar;

  @override
  State<TournamentDetailScreen> createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState extends State<TournamentDetailScreen> {
  bool _isFavorite = false;

  final List<_StatItem> _stats = const [
    _StatItem(value: 'Rs. 5,000', label: 'Entry Fee'),
    _StatItem(value: 'Rs. 150,000', label: 'Prize Pool'),
    _StatItem(value: '11 Players', label: 'Team Size'),
    _StatItem(value: '12 / 16 Teams', label: 'Slots'),
  ];

  final List<String> _rules = const [
    'Maximum 11 players',
    'White cricket kit required',
    'Reporting time: 30 minutes before the match',
    'Umpire decision is final',
    'Full rulebook (Download PDF)',
  ];

  final List<String> _amenities = const ['Parking', 'Locker', 'Cafe'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 250.h,
              width: double.infinity,
              child: Stack(
                children: [
                  Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 320.h,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.3),
                          Colors.transparent,
                          Colors.black.withValues(alpha: 0.5),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      children: [
                        _CircleAction(
                          onTap: () => Get.back(),
                          child: Image.asset(
                            AssetsIcons.back,
                            width: 18.w,
                            height: 18.h,
                            color: AppColors.white,
                            errorBuilder: (_, __, ___) => Icon(
                              Icons.arrow_back_ios_new,
                              color: AppColors.white,
                              size: 16.sp,
                            ),
                          ),
                        ),
                        const Spacer(),
                        _CircleAction(
                          onTap: () {},
                          child: Icon(
                            Icons.ios_share_rounded,
                            color: AppColors.white,
                            size: 18.sp,
                          ),
                        ),
                        10.horizontalSpace,
                        _CircleAction(
                          onTap: () {
                            setState(() => _isFavorite = !_isFavorite);
                          },
                          child: Icon(
                            _isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: AppColors.green,
                            size: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsImages.allBg),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(28.r),
                    topRight: Radius.circular(28.r),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 24.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          textAlign: TextAlign.center,
                          widget.title,
                          style: TextStyle(
                            fontSize: 24.sp,
                            fontFamily: AppFonts.satoshi,
                            fontWeight: FontWeight.w700,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      8.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.club,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: AppFonts.satoshi,
                              color: AppColors.white.withValues(alpha: 0.55),
                            ),
                          ),
                          20.horizontalSpace,
                          Text(
                            'Sport: ${widget.sport}',
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: AppFonts.satoshi,
                              color: AppColors.white.withValues(alpha: 0.55),
                            ),
                          ),
                        ],
                      ),
                      18.verticalSpace,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '18 - 20',
                                style: TextStyle(
                                  fontSize: 26.sp,
                                  fontFamily: AppFonts.satoshi,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'July 2026',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: AppFonts.satoshi,
                                  color: AppColors.white.withValues(
                                    alpha: 0.55,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          20.horizontalSpace,
                          Container(
                            width: 1,
                            height: 48.h,
                            color: AppColors.white.withValues(alpha: 0.2),
                          ),
                          20.horizontalSpace,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '6 - 11 PM',
                                style: TextStyle(
                                  fontSize: 26.sp,
                                  fontFamily: AppFonts.satoshi,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.white,
                                ),
                              ),
                              4.verticalSpace,
                              Text(
                                'Match Time',
                                style: TextStyle(
                                  fontSize: 13.sp,
                                  fontFamily: AppFonts.satoshi,
                                  color: AppColors.white.withValues(
                                    alpha: 0.55,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      18.verticalSpace,
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation.',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: AppFonts.satoshi,
                          height: 1.45,
                          color: AppColors.white.withValues(alpha: 0.6),
                        ),
                      ),
                      22.verticalSpace,
                      Text(
                        'Quick Stats',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      12.verticalSpace,
                      Row(
                        children: List.generate(_stats.length, (index) {
                          final stat = _stats[index];
                          return Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: index == _stats.length - 1 ? 0 : 8.w,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 8.w,
                                  vertical: 12.h,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF23243A),
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: Border.all(
                                    color: AppColors.green.withValues(
                                      alpha: 0.25,
                                    ),
                                  ),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      stat.value,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 11.sp,
                                        fontFamily: AppFonts.satoshi,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.white,
                                      ),
                                    ),
                                    6.verticalSpace,
                                    Text(
                                      stat.label,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        fontFamily: AppFonts.satoshi,
                                        color: AppColors.white.withValues(
                                          alpha: 0.55,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      22.verticalSpace,
                      Text(
                        'Registration Deadline',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        '16 July 2026',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: AppFonts.satoshi,
                          color: AppColors.white.withValues(alpha: 0.55),
                        ),
                      ),
                      22.verticalSpace,
                      Text(
                        'Format',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      6.verticalSpace,
                      Text(
                        'Knockout',
                        style: TextStyle(
                          fontSize: 13.sp,
                          fontFamily: AppFonts.satoshi,
                          color: AppColors.white.withValues(alpha: 0.55),
                        ),
                      ),
                      22.verticalSpace,
                      Text(
                        'Tournament Rules',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      12.verticalSpace,
                      ..._rules.map(
                        (rule) => Padding(
                          padding: EdgeInsets.only(bottom: 10.h),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: AppColors.green,
                                size: 18.sp,
                              ),
                              10.horizontalSpace,
                              Expanded(
                                child: Text(
                                  rule,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: AppFonts.satoshi,
                                    color: AppColors.white.withValues(
                                      alpha: 0.7,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      12.verticalSpace,
                      Text(
                        'Amenities',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      12.verticalSpace,
                      Wrap(
                        spacing: 10.w,
                        runSpacing: 10.h,
                        children: _amenities
                            .map(
                              (item) => Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 8.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.orange,
                                  borderRadius: BorderRadius.circular(999.r),
                                ),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontFamily: AppFonts.satoshi,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.white,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                      22.verticalSpace,
                      Text(
                        "Where You'll be",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: AppFonts.satoshi,
                          fontWeight: FontWeight.w700,
                          color: AppColors.white,
                        ),
                      ),
                      10.verticalSpace,
                      Row(
                        children: [
                          Image.asset(
                            AssetsIcons.loc,
                            width: 16.w,
                            height: 16.h,
                            color: AppColors.orange,
                            errorBuilder: (_, __, ___) => Icon(
                              Icons.location_on,
                              color: AppColors.orange,
                              size: 16.sp,
                            ),
                          ),
                          6.horizontalSpace,
                          Text(
                            widget.location,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: AppFonts.satoshi,
                              color: AppColors.white.withValues(alpha: 0.55),
                            ),
                          ),
                        ],
                      ),
                      12.verticalSpace,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16.r),
                        child: Container(
                          height: 180.h,
                          width: double.infinity,
                          color: const Color(0xFF2A2B3D),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              CustomPaint(painter: _MapGridPainter()),
                              Center(
                                child: Icon(
                                  Icons.location_on,
                                  color: AppColors.orange,
                                  size: 40.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (widget.showJoinBar)
              Container(
                padding: EdgeInsets.fromLTRB(20.w, 14.h, 20.w, 12.h),
                decoration: BoxDecoration(
                  color: const Color(0xFF1B1C2D),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.35),
                      blurRadius: 16,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Text(
                      'PKR 5,000',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontFamily: AppFonts.satoshi,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    20.horizontalSpace,
                    Expanded(
                      child: AppButton(
                        text: 'Join Now',
                        gradientColors: const [
                          AppColors.green,
                          Color(0xFF1AD1B0),
                        ],
                        textColor: AppColors.black,
                        height: 50.h,
                        onTap: () =>
                            Get.to(() => const JoinTournamentScreen()),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _StatItem {
  const _StatItem({required this.value, required this.label});

  final String value;
  final String label;
}

class _CircleAction extends StatelessWidget {
  const _CircleAction({required this.onTap, required this.child});

  final VoidCallback onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40.w,
        height: 40.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black.withValues(alpha: 0.45),
        ),
        child: child,
      ),
    );
  }
}

class _MapGridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.08)
      ..strokeWidth = 1;

    const step = 28.0;
    for (double x = 0; x < size.width; x += step) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (double y = 0; y < size.height; y += step) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    final road = Paint()
      ..color = Colors.white.withValues(alpha: 0.18)
      ..strokeWidth = 3;
    canvas.drawLine(
      Offset(0, size.height * 0.35),
      Offset(size.width, size.height * 0.55),
      road,
    );
    canvas.drawLine(
      Offset(size.width * 0.3, 0),
      Offset(size.width * 0.55, size.height),
      road,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
