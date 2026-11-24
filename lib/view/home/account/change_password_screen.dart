import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/app_text_styles.dart';
import 'package:khel_pakistan/utils/assets_icons.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_card.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';
import 'package:khel_pakistan/widgets/password_updated_sheet.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _existingController = TextEditingController();
  final _newController = TextEditingController();
  final _confirmController = TextEditingController();

  bool _obscureExisting = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void initState() {
    super.initState();
    // Re-check the requirement ticks as the user types.
    _newController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _existingController.dispose();
    _newController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  IconData _eye(bool obscured) =>
      obscured ? Icons.visibility_off_outlined : Icons.visibility_outlined;

  @override
  Widget build(BuildContext context) {
    final pw = _newController.text;
    return AppPage(
      title: 'Change Password',
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              label: 'Current Password',
              controller: _existingController,
              hintText: 'Enter current password',
              prefixIcon: AssetsIcons.lock,
              obscureText: _obscureExisting,
              suffixIcon: _eye(_obscureExisting),
              onSuffixTap: () =>
                  setState(() => _obscureExisting = !_obscureExisting),
            ),
            16.verticalSpace,
            AppTextField(
              label: 'New Password',
              controller: _newController,
              hintText: 'Enter new password',
              prefixIcon: AssetsIcons.lock,
              obscureText: _obscureNew,
              suffixIcon: _eye(_obscureNew),
              onSuffixTap: () => setState(() => _obscureNew = !_obscureNew),
            ),
            16.verticalSpace,
            AppTextField(
              label: 'Confirm Password',
              controller: _confirmController,
              hintText: 'Re-enter new password',
              prefixIcon: AssetsIcons.lock,
              obscureText: _obscureConfirm,
              suffixIcon: _eye(_obscureConfirm),
              onSuffixTap: () =>
                  setState(() => _obscureConfirm = !_obscureConfirm),
            ),
            22.verticalSpace,
            AppCard(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password must contain:',
                    style: AppTextStyles.bodyMedium.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  12.verticalSpace,
                  _Requirement('At least 8 characters', pw.length >= 8),
                  8.verticalSpace,
                  _Requirement(
                    'Mix of letters and numbers',
                    RegExp(r'[A-Za-z]').hasMatch(pw) &&
                        RegExp(r'\d').hasMatch(pw),
                  ),
                  8.verticalSpace,
                  _Requirement(
                    'At least one special character',
                    RegExp(r'[^A-Za-z0-9]').hasMatch(pw),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottom: AppButton(
        text: 'Save Password',
        onTap: () => showPasswordUpdatedSheet(context),
      ),
    );
  }
}

/// One password rule; turns lime with a tick once [met].
class _Requirement extends StatelessWidget {
  const _Requirement(this.text, this.met);

  final String text;
  final bool met;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: 20.r,
          height: 20.r,
          decoration: BoxDecoration(
            color: met ? AppColors.primary : AppColors.card,
            shape: BoxShape.circle,
          ),
          child: met
              ? Icon(Icons.check, size: 13.r, color: AppColors.onPrimary)
              : null,
        ),
        10.horizontalSpace,
        Text(
          text,
          style: AppTextStyles.body.copyWith(
            fontSize: 13.sp,
            color: met ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
