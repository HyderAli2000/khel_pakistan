import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:khel_pakistan/utils/app_colors.dart';
import 'package:khel_pakistan/utils/assets_images.dart';
import 'package:khel_pakistan/view/home/account/profile_updated_screen.dart';
import 'package:khel_pakistan/widgets/app_button.dart';
import 'package:khel_pakistan/widgets/app_page.dart';
import 'package:khel_pakistan/widgets/app_textfield.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _fullNameController = TextEditingController(text: 'Ahmed Khan');
  final _phoneController = TextEditingController(text: '+92 333 456 7890');
  final _cityController = TextEditingController(text: 'Karachi, Pakistan');

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppPage(
      title: 'Edit Profile',
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.w, 24.h, 20.w, 20.h),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(3.r),
                    decoration: const BoxDecoration(
                      color: AppColors.primary,
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 56.r,
                      backgroundImage: const AssetImage(
                        AssetsImages.avatarUser,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 2.r,
                    bottom: 2.r,
                    child: Container(
                      width: 36.r,
                      height: 36.r,
                      decoration: BoxDecoration(
                        color: AppColors.dark,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.background,
                          width: 3,
                        ),
                      ),
                      child: Icon(
                        Icons.photo_camera_outlined,
                        size: 17.r,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            32.verticalSpace,
            AppTextField(
              label: 'Full Name',
              controller: _fullNameController,
              hintText: 'Enter your full name',
              prefixIconData: Icons.person_outline_rounded,
              textInputAction: TextInputAction.next,
            ),
            14.verticalSpace,
            AppTextField(
              label: 'Phone (WhatsApp)',
              controller: _phoneController,
              hintText: '+92 3XX XXXXXXX',
              prefixIconData: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
            ),
            14.verticalSpace,
            AppTextField(
              label: 'City',
              controller: _cityController,
              hintText: 'Your city',
              prefixIconData: Icons.location_on_outlined,
            ),
          ],
        ),
      ),
      bottom: AppButton(
        text: 'Save Changes',
        onTap: () => Get.to(() => const ProfileUpdatedScreen()),
      ),
    );
  }
}
