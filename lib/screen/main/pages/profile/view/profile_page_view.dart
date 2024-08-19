import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/common/widget/app_bar/custom_app_bar.dart';
import 'package:presence_app/common/widget/field/text/app_text_field.dart';
import 'package:presence_app/models/subject/subject.dart';
import 'package:presence_app/screen/main/pages/profile/state/profile_page_state.dart';
import 'package:presence_app/screen/schedule/schedule_screen.dart';
import 'package:presence_app/util/extension/date_extensions.dart';
import 'package:presence_app/util/extension/string_extensions.dart';
import 'package:search_highlight_text/search_highlight_text.dart';
import 'package:utopia_arch/utopia_arch.dart';

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
        ),
        const SizedBox(height: 16),
        const Text(
          'Computer Science',
          style: AppText.smallHeader,
        ),
        const SizedBox(height: 4),
        Text(
          state.subjectsWithPeriodList[0].group,
          style: AppText.small,
        ),
        const SizedBox(height: 8),
        _buildProfileItems(context),
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
              _buildSearchField(context),
              const SizedBox(height: 12),
              _buildSubjectItemList(state),
            ],
          ),
        ),
      ],
    );
  }

  AppTextField _buildSearchField(BuildContext context) {
    return AppTextField(
      state: state.searchFieldState,
      prefix: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Icon(
          Icons.search,
          color: AppColors.niceWhite.withOpacity(0.8),
        ),
      ),
      hint: const Text('Search here...'),
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
    );
  }

  Row _buildProfileItems(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            await context.navigator.pushNamed(ScheduleScreen.route);
          },
          child: _buildProfileItem(
            icon: Icons.date_range,
            text: 'Schedule',
          ),
        ),
        GestureDetector(
          // TODO
          child: _buildProfileItem(
            icon: Icons.person_off_outlined,
            text: 'Absences',
          ),
        ),
        GestureDetector(
          // TODO
          child: _buildProfileItem(
            icon: Icons.help_center_outlined,
            text: 'Help',
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

  Widget _buildBottomModalContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 2 +
            MediaQuery.of(context).viewInsets.bottom,
        width: double.infinity,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            gradient: AppColors.gradientModal,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _buildSubjectItemList(ProfilePageState state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.searchFieldState.value.isEmpty
            ? state.upcomingClasses.length
            : state.upcomingClasses
                .where(
                  (element) => element.courseName
                      .toLowerCase()
                      .contains(state.searchFieldState.value.toLowerCase()),
                )
                .length,
        itemBuilder: (context, index) => _buildSubjectItem(
          index: index,
          subjects: state.searchFieldState.value.isEmpty
              ? state.upcomingClasses
              : state.upcomingClasses
                  .where(
                    (element) => element.courseName
                        .toLowerCase()
                        .contains(state.searchFieldState.value.toLowerCase()),
                  )
                  .toList(),
        ),
      ),
    );
  }

  Widget _buildSubjectItem({
    required int index,
    required List<Subject> subjects,
  }) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.button.withOpacity(0.8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subjects[index].date.toDisplayString(),
                style: AppText.date,
              ),
              const SizedBox(height: 2),
              SearchTextInheritedWidget(
                highlightColor: AppColors.secondaryBlue,
                searchText: state.searchFieldState.value,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.elasticOut,
                  style: state.searchFieldState.value.isNotEmpty
                      ? AppText.smallHeader.copyWith(fontSize: 28)
                      : AppText.smallHeader,
                  child: SearchHighlightText(
                    subjects[index].courseName,
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Text(
                subjects[index].courseType.capitalize(),
                style: AppText.smallerHeader,
              ),
              Text(
                subjects[index].day,
                style: AppText.smaller,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildProfileItem({required IconData icon, required String text}) {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        color: AppColors.button,
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
