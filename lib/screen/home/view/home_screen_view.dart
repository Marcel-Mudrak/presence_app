import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_images.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/screen/home/state/home_screen_state.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({required this.state});

  final HomeScreenState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(gradient: AppColors.gradientSecondary),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAppBar(),
                const SizedBox(height: 16),
                // TODO localizations
                const Text('Hello Marcel,', style: AppText.small),
                const Text('Ready to learn?', style: AppText.secondaryHeader),
                // Divider(color: AppColors.niceBlue),
                const SizedBox(height: 18),
                _buildSubject(
                  smallTitle: 'Right now you have',
                  subject: 'Enterprise Systems',
                  time: '13:00 - 14:30',
                  date: '06.04.2024 - Friday',
                  absences: ['1', '2'],
                ),
                const SizedBox(height: 18),
                _buildSubject(
                  smallTitle: 'Next',
                  subject: 'Data Mining',
                  time: '14:45 - 16:15',
                  date: '06.04.2024 - Friday',
                  absences: ['3', '5'],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _buildSubject({
    required String smallTitle,
    required String subject,
    required String time,
    required String date,
    required List<String> absences,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          smallTitle,
          style: AppText.smaller,
        ),
        Text(
          subject,
          style: AppText.mainHeader,
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Text(
              time,
              style: AppText.time,
            ),
            const SizedBox(
              height: 25,
              child: VerticalDivider(
                color: AppColors.niceWhite,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Unexcused absences: ',
                        style: AppText.smallest,
                      ),
                      TextSpan(
                        text: absences[0],
                        style: AppText.smallest.copyWith(
                            fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Total: ',
                        style: AppText.smallest,
                      ),
                      TextSpan(
                        text: absences[1],
                        style: AppText.smallest.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          date,
          style: AppText.date,
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Row(
      children: [
        Image.asset(
          AppImages.logo,
          scale: 10,
        ),
        const SizedBox(
            height: 30,
            child: VerticalDivider(
              color: AppColors.niceWhite,
              width: 15,
              thickness: 1,
            )),
        const Text('Presence App', style: AppText.appBarTitle),
        const Spacer(),
        const Icon(
          Icons.settings,
          color: AppColors.niceWhite,
        )
      ],
    );
  }
}
