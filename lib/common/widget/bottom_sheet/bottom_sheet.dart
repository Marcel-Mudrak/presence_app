import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';

class CustomBottomSheet extends StatelessWidget {
  static Future<void> show(
    BuildContext context, {
    required String courseName,
    required bool? isCardScanned,
    required bool isScanPossible,
  }) async {
    if (isScanPossible) {
      await showModalBottomSheet<Widget>(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) => CustomBottomSheet(
          courseName: courseName,
          isCardScanned: isCardScanned,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
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
      );
    }
  }

  const CustomBottomSheet({
    super.key,
    required this.courseName,
    required this.isCardScanned,
  });

  final String courseName;
  final bool? isCardScanned;

  @override
  Widget build(BuildContext context) {
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
                    courseName,
                    style: AppText.smallerHeader,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),
                  if (isCardScanned ?? false)
                    const Text(
                      'Presence registered',
                      style: AppText.small,
                      textAlign: TextAlign.center,
                    )
                  else
                    const Text(
                      'Please scan the room NFC card to register presence',
                      style: AppText.small,
                      textAlign: TextAlign.center,
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
