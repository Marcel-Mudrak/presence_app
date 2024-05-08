import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.gradientSecondary,
      ),
    );
  }
}
