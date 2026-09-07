import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';

class AppBottomNavItem {
  const AppBottomNavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });

  final String label;
  final String icon;
  final String activeIcon;
}

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
  });

  final int currentIndex;
  final List<AppBottomNavItem> items;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff1C2F3B),
          borderRadius: BorderRadius.circular(9999999.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 14.h),
            child: Row(
              children: List.generate(items.length, (index) {
                return Expanded(
                  child: _NavItem(
                    item: items[index],
                    selected: currentIndex == index,
                    onTap: () => onTap(index),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.item,
    required this.selected,
    required this.onTap,
  });

  final AppBottomNavItem item;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? AppColors.orange : Colors.white;

    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              selected ? item.activeIcon : item.icon,
              width: 24.w,
              height: 24.h,
              color: color,
              fit: BoxFit.contain,
            ),
            4.verticalSpace,
            Text(
              item.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: Colors.white,
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
