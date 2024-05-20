import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/common/widget/field/text/app_text_field.dart';
import 'package:presence_app/screen/main/pages/profile/state/profile_page_state.dart';
import 'package:presence_app/screen/main/widgets/custom_app_bar.dart';

class ProfilePageView extends StatelessWidget {
  const ProfilePageView({required this.state});

  final ProfilePageState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppBar(
          pageName: 'Marcel Mudrak',
          icon: Icons.person,
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
              icon: Icons.person_off_outlined,
              text: 'Absences',
            ),
            _buildProfileItem(
              icon: Icons.help_center_outlined,
              text: 'Help',
            ),
          ],
        ),
        const SizedBox(height: 8),
        Expanded(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(4),
                child: Row(
                  children: [
                    Text('Recent Subjects', style: AppText.secondaryHeader),
                    Spacer(),
                    Text('Filters', style: AppText.smaller),
                    SizedBox(width: 4),
                    Icon(
                      Icons.filter_list,
                      color: AppColors.niceWhite,
                      size: 24,
                    ),
                  ],
                ),
              ),
              AppTextField(
                state: state.searchFieldState,
                hint: Row(
                  children: [
                    const SizedBox(width: 2),
                    Icon(Icons.search,
                        color: AppColors.niceWhite.withAlpha(128)),
                    const SizedBox(width: 4),
                    const Text('Search'),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              _buildSubjectItemList(),
            ],
          ),
        ),
      ],
    );
  }

  Expanded _buildSubjectItemList() {
    return Expanded(
      child: RawScrollbar(
        padding: const EdgeInsets.symmetric(vertical: 16),
        thumbColor: AppColors.niceWhite.withAlpha(128),
        thickness: 4,
        radius: const Radius.circular(64),
        child: ListView.separated(
          itemCount: 16,
          itemBuilder: (context, index) =>
              _buildPresenceItem(index: index.toString()),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }

  Widget _buildPresenceItem({required String index}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '15-05-2024',
          style: AppText.date,
        ),
        Text(
          'Information System Security  ' + index,
          style: AppText.smallHeader,
        ),
        SizedBox(height: 4),
        Text(
          '08:00 - 09:30',
          style: AppText.smaller,
        )
      ],
    );
  }

  Widget _buildProfileItem({required IconData icon, required String text}) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.button.withAlpha(128),
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
