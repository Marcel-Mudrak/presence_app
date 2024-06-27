import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/common/widget/field/text/app_text_field.dart';
import 'package:presence_app/models/subject/subject.dart';
import 'package:presence_app/screen/main/pages/profile/state/profile_page_state.dart';
import 'package:presence_app/screen/main/widgets/custom_app_bar.dart';
import 'package:presence_app/util/extension/date_extensions.dart';
import 'package:presence_app/util/extension/string_extensions.dart';

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
        const Text(
          'Computer Science',
          style: AppText.smallHeader,
        ),
        const SizedBox(height: 4),
        const Text(
          'ZIIAS1-3611',
          style: AppText.small,
        ),
        const SizedBox(height: 8),
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
                    Text('Upcoming Subjects', style: AppText.secondaryHeader),
                  ],
                ),
              ),
              AppTextField(
                state: state.searchFieldState,
                prefix: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Icon(
                    Icons.search,
                    color: AppColors.niceWhite.withAlpha(128),
                  ),
                ),
                hint: const Text('Search'),
                suffix: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    await _buildBottomModal(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(
                      Icons.tune,
                      color: AppColors.niceWhite.withAlpha(196),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              _buildSubjectItemList(state),
            ],
          ),
        ),
      ],
    );
  }

  Future<dynamic> _buildBottomModal(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withAlpha(196),
      context: context,
      builder: _buildBottomModalContent,
    );
  }

  SizedBox _buildBottomModalContent(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2 +
          MediaQuery.of(context).viewInsets.bottom,
      width: double.infinity,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          gradient: AppColors.gradientPrimary,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
      ),
    );
  }

  Expanded _buildSubjectItemList(ProfilePageState state) {
    return Expanded(
      child: RawScrollbar(
        padding: const EdgeInsets.symmetric(vertical: 16),
        thumbColor: AppColors.niceWhite.withAlpha(128),
        thickness: 4,
        radius: const Radius.circular(64),
        child: ListView.separated(
          itemCount: state.upcomingClasses.length,
          itemBuilder: (context, index) => _buildPresenceItem(
            index: index,
            subjects: state.upcomingClasses,
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        ),
      ),
    );
  }

  Widget _buildPresenceItem({
    required int index,
    required List<Subject> subjects,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          subjects[index].date.toDisplayString(),
          style: AppText.date,
        ),
        Text(
          subjects[index].courseName,
          style: AppText.smallHeader,
        ),
        const SizedBox(height: 2),
        Text(
          subjects[index].courseType.capitalize(),
          style: AppText.smallerHeader,
        ),
        Text(
          subjects[index].day,
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
