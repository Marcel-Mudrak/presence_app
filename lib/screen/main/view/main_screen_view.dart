import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/screen/main/pages/home/home_page.dart';
import 'package:presence_app/screen/main/pages/home/widgets/custom_bottom_nav_bar.dart';
import 'package:presence_app/screen/main/state/main_screen_state.dart';

class MainScreenView extends StatelessWidget {
  final MainScreenState state;

  const MainScreenView({required this.state});

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
        child: const SafeArea(
          child: HomePage(),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(),
    );
  }
}
