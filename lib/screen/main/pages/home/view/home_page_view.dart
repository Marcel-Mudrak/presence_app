import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/screen/main/pages/home/state/home_page_state.dart';
import 'package:presence_app/screen/main/pages/home/widgets/subject_item.dart';
import 'package:presence_app/screen/main/widgets/custom_app_bar.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({required this.state});

  final HomePageState state;

  @override
  Widget build(BuildContext context) {
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
        // Divider(color: AppColors.niceBlue),
        Text(
          DateFormat('dd-MM-yyyy').format(DateTime.now()),
          style: AppText.date,
        ),
        const SizedBox(height: 18),
        // TODO
        const SubjectItem(
          smallTitle: 'Today you have',
          subject: 'Enterprise Systems',
          time: '13:00 - 14:30',
          absences: ['1', '2'],
        ),
        const SizedBox(height: 8),
        const SubjectItem(
          smallTitle: 'Next',
          subject: 'Data Mining',
          time: '14:45 - 16:15',
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
        const AbsenceButton(
          buttonCaption: 'Excused absence',
          caption: "If you can't make it.",
          icon: Icons.attach_file,
          shouldRotate: true,
        ),
        const Spacer(),
      ],
    );
  }
}

class AbsenceButton extends StatelessWidget {
  const AbsenceButton({
    super.key,
    required this.buttonCaption,
    required this.caption,
    required this.icon,
    required this.shouldRotate,
  });

  final String buttonCaption;
  final String caption;
  final IconData? icon;
  final bool shouldRotate;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.4;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () async {
            await _buildShowModalBottomSheet(context, height);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(64),
              color: AppColors.button.withAlpha(164),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Text(
                  buttonCaption,
                  style: AppText.smaller,
                ),
                const SizedBox(width: 6),
                Transform.rotate(
                  angle: shouldRotate ? math.pi / 4 : 0,
                  child: Icon(
                    icon,
                    color: AppColors.niceWhite,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> _buildShowModalBottomSheet(
      BuildContext context, double height) {
    return showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return SizedBox(
          height: height,
          width: double.infinity,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              gradient: AppColors.gradientPrimary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: SizedBox(
                    width: 70,
                    height: 4,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.niceWhite,
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                ),
                const Text(
                  'Message',
                  style: AppText.secondaryHeader,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
