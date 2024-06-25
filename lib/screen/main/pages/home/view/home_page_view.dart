import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/screen/main/pages/home/state/home_page_state.dart';
import 'package:presence_app/screen/main/pages/home/widgets/absence_button.dart';
import 'package:presence_app/screen/main/pages/home/widgets/subject_item.dart';
import 'package:presence_app/screen/main/widgets/custom_app_bar.dart';

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
          icon: Icons.language,
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
        SubjectItem(
          smallTitle: 'Today you have',
          subject: state.todayClasses[0].courseName,
          time: state.todayClasses[0].day.substring(3),
          absences: const ['1', '2'],
        ),
        const SizedBox(height: 8),
        SubjectItem(
          smallTitle: 'Next',
          subject: state.todayClasses[1].courseName,
          time: state.todayClasses[1].day.substring(3),
          isNext: true,
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
