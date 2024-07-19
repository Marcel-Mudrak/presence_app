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
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 16,
            ),
            decoration: const BoxDecoration(
              gradient: AppColors.gradientPrimary,
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
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(state: state),
    );
  }
}
