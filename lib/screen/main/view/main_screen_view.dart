import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/screen/main/state/main_screen_state.dart';
import 'package:presence_app/screen/main/widgets/custom_bottom_nav_bar.dart';
import 'package:utopia_arch/utopia_arch.dart';

class MainScreenView extends StatelessWidget {
  final MainScreenState state;

  const MainScreenView({required this.state});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(
          left: 24,
          right: 24,
          top: 16,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: AppColors.gradientSecondary,
        ),
        child: SafeArea(
          child: CrossFadeIndexedStack(
            duration: const Duration(milliseconds: 400),
            index: state.currentPage.index,
            children: [
              for (final page in MainPage.values) page.builder(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(state: state),
    );
  }
}
