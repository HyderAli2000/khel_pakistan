import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';

/// Date strip + duration + time-slot grid (+ optional player count).
/// Used by "book a venue" and "reschedule booking".
class DateTimePicker extends StatefulWidget {
  const DateTimePicker({super.key, this.showPlayers = false});

  final bool showPlayers;

  @override
  State<DateTimePicker> createState() => _DateTimePickerState();
}

class _DateTimePickerState extends State<DateTimePicker> {
  static const _durations = [1, 2, 3, 4, 5, 6];
  static const _slots = [
    '04:00 PM',
    '05:00 PM',
    '06:00 PM',
    '07:00 PM',
    '08:00 PM',
    '09:00 PM',
  ];
  static const _unavailable = {'06:00 PM'};
  static const _days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  static const _months = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', //
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  final _playersController = TextEditingController();
  late final List<DateTime> _dates;
  int _dateIndex = 0;
  int _duration = 2;
  int? _slotIndex;

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    _dates = List.generate(14, (i) => today.add(Duration(days: i)));
  }

  @override
  void dispose() {
    _playersController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(0, 12.h, 0, 20.h),
      children: [
        _heading('Select Date'),
        SizedBox(
          height: 92.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            itemCount: _dates.length,
            separatorBuilder: (_, __) => 10.horizontalSpace,
            itemBuilder: (_, i) {
              final d = _dates[i];
              final selected = i == _dateIndex;
              return _SelectBox(
                selected: selected,
                width: 66.w,
                onTap: () => setState(() => _dateIndex = i),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(_days[d.weekday - 1], style: _small(selected)),
                    4.verticalSpace,
                    Text(
                      d.day.toString().padLeft(2, '0'),
                      style: AppTextStyles.h2.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    2.verticalSpace,
                    Text(_months[d.month - 1], style: _small(selected)),
                  ],
                ),
              );
            },
          ),
        ),
        _heading('Duration'),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              for (final h in _durations) ...[
                Expanded(
                  child: _SelectBox(
                    selected: h == _duration,
                    height: 42.h,
                    onTap: () => setState(() => _duration = h),
                    child: Center(
                      child: Text(
                        '${h}h',
                        style: AppTextStyles.bodyMedium.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                if (h != _durations.last) 8.horizontalSpace,
              ],
            ],
          ),
        ),
        _heading('Select a Time Slot'),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 10.w,
          childAspectRatio: 2.4,
          children: [
            for (var i = 0; i < _slots.length; i++)
              _slotTile(i, booked: _unavailable.contains(_slots[i])),
          ],
        ),
        if (widget.showPlayers) ...[
          _heading('Number of Players'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: AppTextField(
              hintText: 'e.g. 8',
              controller: _playersController,
              prefixIconData: Icons.groups_outlined,
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ],
    );
  }

  Widget _slotTile(int i, {required bool booked}) {
    return Opacity(
      opacity: booked ? 0.45 : 1,
      child: _SelectBox(
        selected: _slotIndex == i,
        onTap: booked ? null : () => setState(() => _slotIndex = i),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                _slots[i],
                style: AppTextStyles.subtitle.copyWith(fontSize: 15.sp),
              ),
              2.verticalSpace,
              Text(
                booked ? 'Booked' : '${_duration}h • Rs 3,000/hr',
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _small(bool selected) => AppTextStyles.caption.copyWith(
    color: selected ? AppColors.onPrimary : AppColors.textSecondary,
  );

  Widget _heading(String text) => Padding(
    padding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0),
    child: FieldLabel(text),
  );
}

/// White box that turns lime with a dark border when selected.
class _SelectBox extends StatelessWidget {
  const _SelectBox({
    required this.selected,
    required this.child,
    this.onTap,
    this.width,
    this.height,
  });

  final bool selected;
  final Widget child;
  final VoidCallback? onTap;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surface,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(
            color: selected ? AppColors.dark : AppColors.divider,
            width: selected ? 1.5 : 1,
          ),
        ),
        child: child,
      ),
    );
  }
}
