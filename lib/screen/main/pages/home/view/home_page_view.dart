import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/common/widget/app_bar/custom_app_bar.dart';
import 'package:presence_app/screen/main/pages/home/state/home_page_state.dart';
import 'package:presence_app/screen/main/pages/home/widgets/absence_button.dart';
import 'package:presence_app/screen/main/pages/home/widgets/subject_item.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({required this.state});

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
        const SizedBox(height: 4),
        Row(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () async => state.todayLaterClasses.isNotEmpty &&
                          state.todayLaterClasses[0].date
                              .subtract(
                                const Duration(minutes: 15),
                              )
                              .isBefore(
                                DateTime.now(),
                              ) &&
                          state.todayLaterClasses[0].dateEnd
                              .add(
                                const Duration(minutes: 15),
                              )
                              .isAfter(
                                DateTime.now(),
                              )
                      ? _buildBottomModal(context)
                      : ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColors.lightButton,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Nothing to register!',
                                  style: AppText.smallHeader,
                                ),
                              ],
                            ),
                          ),
                        ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: AppColors.lightBlue,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
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
              ],
            ),
          ],
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
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.decelerate,
        height: MediaQuery.of(context).size.height / 2 + MediaQuery.of(context).viewInsets.bottom,
        width: double.infinity,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: AppColors.gradientModal,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Register you presence for:',
                    style: AppText.secondaryHeader,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    state.todayLaterClasses[0].courseName,
                    style: AppText.smallerHeader,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  if (state.decodedMessage?.endsWith('en1') ?? false)
                    const Text(
                      'Presence registered',
                      style: AppText.smaller,
                    )
                  else
                    const Text(
                      'Please scan the room NFC card to register presence',
                      style: AppText.smaller,
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
