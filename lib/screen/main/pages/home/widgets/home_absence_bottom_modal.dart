import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/common/widget/field/text/app_text_field.dart';
import 'package:presence_app/screen/main/pages/home/state/home_page_state.dart';

class HomeAbsenceBottomModal extends StatelessWidget {
  const HomeAbsenceBottomModal({
    super.key,
    required this.state,
    required this.buttonCaption,
    required this.shouldRotate,
    required this.icon,
  });

  final HomePageState state;
  final String buttonCaption;
  final bool shouldRotate;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await _buildBottomModal(context);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
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

  AnimatedContainer _buildBottomModalContent(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.decelerate,
      height: MediaQuery.of(context).size.height / 2 + MediaQuery.of(context).viewInsets.bottom,
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
                    color: AppColors.niceWhite.withAlpha(128),
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "You can't make it?",
              style: AppText.secondaryHeader,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: AppColors.button.withAlpha(128),
                ),
                padding: const EdgeInsets.all(12),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.upload,
                      color: AppColors.niceWhite,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'Upload document',
                      style: AppText.smaller,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Include a short message',
              style: AppText.small,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: AppTextField(
                state: state.searchFieldState,
                maxLines: 3,
                hint: const Row(
                  children: [
                    SizedBox(width: 2),
                    Text('Type here...'),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: AppColors.button.withAlpha(128),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.send,
                    color: AppColors.niceWhite,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Send',
                    style: AppText.smaller,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
