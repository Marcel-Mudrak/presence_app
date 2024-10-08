import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/common/widget/app_bar/custom_app_bar.dart';
import 'package:presence_app/screen/main/pages/home/state/home_page_state.dart';
import 'package:presence_app/screen/main/pages/home/widgets/absence_button.dart';
import 'package:presence_app/screen/main/pages/home/widgets/subject_item.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({
    super.key,
    required this.state,
  });

  final HomePageState state;

  @override
  Widget build(BuildContext context) {
    return _buildHomeContent(state, context);
  }

  Column _buildHomeContent(
    HomePageState state,
    BuildContext context,
  ) {
    return Column(
      children: [
        const CustomAppBar(
          pageName: 'Presence App',
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
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
                if (state.todayLaterClasses.length >= 2) ...[
                  SubjectItem(
                    smallTitle: 'Today you have',
                    subject: state.todayLaterClasses[0].courseName,
                    time: state.todayLaterClasses[0].day.substring(3),
                    // TODO
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
                const SizedBox(height: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                      decoration: BoxDecoration(
                        color: AppColors.button,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status:',
                            style: AppText.smallest.copyWith(color: AppColors.niceBlue),
                          ),
                          if (state.todayLaterClasses.isNotEmpty)
                            Text(
                              state.todayLaterClasses[0].courseName,
                              style: AppText.smaller,
                            ),
                          const SizedBox(height: 4),
                          if (state.isCardScanned)
                            Text(
                              'Presence Registered',
                              style: AppText.smallHeader.copyWith(color: Colors.green.shade300),
                            )
                          else if (!state.isCardScanned && state.todayLaterClasses.isNotEmpty)
                            Text(
                              'Presence not registered yet',
                              style: AppText.smallHeader.copyWith(color: Colors.yellow.shade300),
                            )
                          else
                            const Text(
                              'Nothing to register!',
                              style: AppText.smallHeader,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    GestureDetector(
                      onTap: state.onRegisterPresencePressed,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.lightBlue,
                        ),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Register presence',
                              style: AppText.smaller.copyWith(
                                fontWeight: FontWeight.w400,
                                color: AppColors.button,
                              ),
                            ),
                            const SizedBox(width: 6),
                            const Icon(
                              Icons.person,
                              color: AppColors.button,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    AbsenceButton(
                      buttonCaption: 'Excused absence',
                      caption: "If you can't make it.",
                      icon: Icons.attach_file,
                      shouldRotate: true,
                      state: state,
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
