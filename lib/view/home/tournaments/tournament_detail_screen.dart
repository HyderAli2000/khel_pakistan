import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/tournaments/join_tournament_screen.dart';
import 'package:khel_pakistan/widgets/app_card.dart';
import 'package:khel_pakistan/widgets/detail_layout.dart';

class TournamentDetailScreen extends StatefulWidget {
  const TournamentDetailScreen({
    super.key,
    this.image = AssetsImages.tournament1,
    this.title = 'Karachi Champions League 2026',
    this.club = 'DHA Sports Club',
    this.sport = 'Football',
    this.location = 'DHA Phase 6 • 2.5 km away',
    this.showJoinBar = true,
  });

  final String image;
  final String title;
  final String club;
  final String sport;
  final String location;

  /// false for past tournaments (opened from Tournament History).
  final bool showJoinBar;

  @override
  State<TournamentDetailScreen> createState() => _TournamentDetailScreenState();
}

class _TournamentDetailScreenState extends State<TournamentDetailScreen> {
  bool _isFavorite = false;

  static const _stats = [
    (Icons.payments_outlined, 'Rs. 5,000', 'Entry Fee'),
    (Icons.emoji_events_outlined, 'Rs. 150,000', 'Prize Pool'),
    (Icons.groups_outlined, '11 Players', 'Team Size'),
    (Icons.event_seat_outlined, '12 / 16 Teams', 'Slots'),
  ];

  static const _rules = [
    'Maximum 11 players per team',
    'Proper sports kit required',
    'Report 30 minutes before your match',
    "The referee's decision is final",
  ];

  @override
  Widget build(BuildContext context) {
    return DetailScaffold(
      image: widget.image,
      actions: [
        HeroAction(icon: Icons.ios_share_rounded, onTap: () {}),
        HeroAction(
          icon: _isFavorite
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          onTap: () => setState(() => _isFavorite = !_isFavorite),
        ),
      ],
      bottomBar: widget.showJoinBar
          ? PriceBar(
              price: 'PKR 5,000',
              caption: 'Entry fee per team',
              buttonText: 'Join Now',
              onTap: () => Get.to(() => const JoinTournamentScreen()),
            )
          : null,
      children: [
        DetailTitle(title: widget.title, subtitle: widget.location),
        12.verticalSpace,
        Center(
          child: Wrap(
            spacing: 8.w,
            children: [
              _Tag(icon: Icons.sports_soccer_rounded, text: widget.sport),
              _Tag(icon: Icons.apartment_rounded, text: widget.club),
            ],
          ),
        ),
        18.verticalSpace,
        Row(
          children: [
            const Expanded(
              child: _InfoTile(
                icon: Icons.calendar_today_outlined,
                value: '18 - 20 July',
                label: '2026',
              ),
            ),
            10.horizontalSpace,
            const Expanded(
              child: _InfoTile(
                icon: Icons.schedule_rounded,
                value: '6 - 11 PM',
                label: 'Match time',
              ),
            ),
          ],
        ),
        const DetailParagraph(
          'A three-day knockout tournament for amateur teams across Karachi. '
          'Matches are played under floodlights, with live scores and a '
          'trophy ceremony on the final night.',
        ),
        DetailSection(
          title: 'Quick Stats',
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            childAspectRatio: 2.2,
            children: [
              for (final (icon, value, label) in _stats)
                _InfoTile(icon: icon, value: value, label: label),
            ],
          ),
        ),
        const DetailSection(
          title: 'Key Dates',
          child: AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                _KeyValueRow('Registration deadline', '16 July 2026'),
                Divider(height: 1),
                _KeyValueRow('Format', 'Knockout'),
              ],
            ),
          ),
        ),
        DetailSection(
          title: 'Tournament Rules',
          child: Column(
            children: [
              for (final rule in _rules)
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    children: [
                      Container(
                        width: 20.r,
                        height: 20.r,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check,
                          size: 13.r,
                          color: AppColors.onPrimary,
                        ),
                      ),
                      10.horizontalSpace,
                      Expanded(
                        child: Text(
                          rule,
                          style: AppTextStyles.body.copyWith(fontSize: 13.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: const Text('Full rulebook (PDF)'),
                ),
              ),
            ],
          ),
        ),
        const DetailSection(
          title: 'Amenities',
          child: ChipWrap(
            items: ['Parking', 'Locker', 'Cafe', 'Floodlights'],
            icons: amenityIcons,
          ),
        ),
        DetailSection(
          title: 'Venue',
          child: MapPreview(location: widget.location),
        ),
      ],
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14.r, color: AppColors.textPrimary),
          6.horizontalSpace,
          Text(
            text,
            style: AppTextStyles.caption.copyWith(
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

/// White tile: lime icon circle, bold value and small label.
class _InfoTile extends StatelessWidget {
  const _InfoTile({
    required this.icon,
    required this.value,
    required this.label,
  });

  final IconData icon;
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
      child: Row(
        children: [
          Container(
            width: 36.r,
            height: 36.r,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18.r, color: AppColors.onPrimary),
          ),
          10.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.bodyMedium.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(label, style: AppTextStyles.caption),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _KeyValueRow extends StatelessWidget {
  const _KeyValueRow(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
      child: Row(
        children: [
          Expanded(child: Text(label, style: AppTextStyles.bodySecondary)),
          Text(
            value,
            style: AppTextStyles.bodyMedium.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
