import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/screen/home/state/home_screen_state.dart';
import 'package:presence_app/screen/home/widgets/custom_app_bar.dart';
import 'package:presence_app/screen/home/widgets/custom_bottom_nav_bar.dart';
import 'package:presence_app/screen/home/widgets/subject_item.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({required this.state});

  final HomeScreenState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.gradientSecondary,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const CustomAppBar(),
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
              _buildButton(
                buttonCaption: 'Excused absence',
                caption: "If you can't make it.",
                icon: Icons.attach_file,
                shouldRotate: true,
              ),
              const Spacer(),
              const CustomBottomNavBar(),
            ],
          ),
        ),
      ),
    );
  }

  // TODO
  Row _buildButton({
    required String buttonCaption,
    required String caption,
    required IconData? icon,
    bool shouldRotate = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(64),
            color: AppColors.button,
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
      ],
    );
  }
}
