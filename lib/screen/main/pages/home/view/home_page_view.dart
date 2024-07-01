import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/common/widget/custom_app_bar.dart';
import 'package:presence_app/screen/main/pages/home/state/home_page_state.dart';
import 'package:presence_app/screen/main/pages/home/widgets/absence_button.dart';
import 'package:presence_app/screen/main/pages/home/widgets/subject_item.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({required this.state});

  final HomePageState state;

  @override
  Widget build(BuildContext context) {
    return _buildHomeContent(state);
  }

  Column _buildHomeContent(HomePageState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const CustomAppBar(
          pageName: 'Presence App',
        ),
        const SizedBox(height: 16),
        // TODO localizations
        const Text(
          'Hello Marcel,',
          style: AppText.small,
        ),
        const Text(
          'Ready to learn?',
          style: AppText.secondaryHeader,
        ),
        Text(
          DateFormat('dd-MM-yyyy').format(DateTime.now()),
          style: AppText.date,
        ),
        const SizedBox(height: 18),
        // TODO
        if (state.todayLaterClasses.length >= 2) ...[
          SubjectItem(
            smallTitle: 'Today you have',
            subject: state.todayLaterClasses[0].courseName,
            time: state.todayLaterClasses[0].day.substring(3),
            absences: const ['1', '2'],
          ),
          const SizedBox(height: 8),
          SubjectItem(
            smallTitle: 'Next',
            subject: state.todayLaterClasses[1].courseName,
            time: state.todayLaterClasses[1].day.substring(3),
            isNext: true,
          ),
        ],
        if (state.todayLaterClasses.length == 1)
          SubjectItem(
            smallTitle: 'Today you have',
            subject: state.todayLaterClasses[0].courseName,
            time: state.todayLaterClasses[0].day.substring(3),
            absences: const ['1', '2'],
          ),
        if (state.todayLaterClasses.isEmpty)
          const SubjectItem(
            smallTitle: 'Today you have',
            subject: 'Nothing!',
          ),
        const Divider(
          color: AppColors.niceWhite,
          thickness: 0,
        ),
        const Text(
          'Status',
          style: AppText.smaller,
        ),
        const Text(
          'Presence not registered yet.',
          style: AppText.secondaryHeader,
        ),
        const SizedBox(height: 8),
        const Text(
          'Please scan the NFC card in your classroom.',
          style: AppText.smallest,
        ),
        const SizedBox(height: 16),
        AbsenceButton(
          buttonCaption: 'Excused absence',
          caption: "If you can't make it.",
          icon: Icons.attach_file,
          shouldRotate: true,
          state: state,
        ),
        const Spacer(),
      ],
    );
  }
}
