import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:presence_app/app/state/nfc/nfc_state.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_images.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/models/presence/presence.dart';
import 'package:utopia_arch/utopia_arch.dart';

class CustomBottomSheet extends HookWidget {
  static Future<bool?> show(
    BuildContext context, {
    required String courseName,
    required bool isScanPossible,
    required Future<Presence?> Function({required bool isPresent}) registerPresence,
  }) async {
    if (isScanPossible) {
      return showModalBottomSheet<bool?>(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) => CustomBottomSheet(
          courseName: courseName,
          registerPresence: registerPresence,
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
    return null;
  }

  const CustomBottomSheet({
    super.key,
    required this.courseName,
    required this.registerPresence,
  });

  final String courseName;
  final Future<Presence?> Function({required bool isPresent}) registerPresence;

  @override
  Widget build(BuildContext context) {
    final nfcState = useNfcState();
    final isCardScannedState = useState(false);

    useStreamSubscription(
      nfcState.tagsStream,
      (tag) async {
        if (tag.endsWith('en1')) {
          isCardScannedState.value = true;
          await registerPresence(isPresent: true);
          Future.delayed(
            const Duration(milliseconds: 1500),
            () => Navigator.pop(context, isCardScannedState.value),
          );
        }
      },
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.decelerate,
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
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Register you presence for:',
                    style: AppText.secondaryHeader,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    courseName,
                    style: AppText.smallerHeader,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  if (isCardScannedState.value)
                    Column(
                      children: [
                        const Text(
                          'Presence registered!',
                          style: AppText.small,
                          textAlign: TextAlign.center,
                        ),
                        Lottie.asset(
                          AppImages.checkmarkAnimation,
                          frameRate: const FrameRate(60),
                        ),
                      ],
                    )
                  else
                    Column(
                      children: [
                        const Text(
                          'Please scan the room NFC card to register presence',
                          style: AppText.small,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Lottie.asset(
                          AppImages.scanPhoneAnimation,
                          frameRate: const FrameRate(60),
                          repeat: false,
                        ),
                      ],
                    ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
