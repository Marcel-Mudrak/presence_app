import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/screen/main/pages/profile/state/profile_page_state.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({required this.state});

  final ProfilePageState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Text(
              'Marcel Mudrak',
              style: AppText.mainHeader,
            ),
            Spacer(),
            // TODO Profile image instead of icon
            Icon(
              Icons.person,
              color: AppColors.niceWhite,
              size: 48,
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildProfileItem(
              icon: Icons.date_range,
              text: 'Schedule',
            ),
            _buildProfileItem(
              icon: Icons.person_off,
              text: 'Absences',
            ),
            _buildProfileItem(
              icon: Icons.help_center,
              text: 'Help',
            ),
          ],
        ),
        const SizedBox(height: 16),
        const Divider(color: AppColors.niceWhite),
      ],
    );
  }

  Widget _buildProfileItem({required IconData icon, required String text}) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.button.withAlpha(180),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.niceWhite,
            size: 32,
          ),
          Text(
            text,
            style: AppText.smaller,
          ),
        ],
      ),
    );
  }
}
