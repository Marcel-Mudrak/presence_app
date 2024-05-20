import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/screen/main/state/main_screen_state.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({required this.state});

  final MainScreenState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      color: AppColors.button,
      child: GNav(
        iconSize: 28,
        color: AppColors.niceWhite,
        activeColor: AppColors.button,
        selectedIndex: 1,
        textStyle: AppText.smaller.copyWith(
          color: AppColors.button,
          fontWeight: FontWeight.w400,
        ),
        tabBackgroundColor: AppColors.niceWhite,
        tabBorderRadius: 16,
        gap: 8,
        padding: const EdgeInsets.all(14),
        onTabChange: (index) async {
          if (index == 0) state.onPageChanged(MainPage.profile);
          if (index == 1) state.onPageChanged(MainPage.home);
          if (index == 2) state.onPageChanged(MainPage.settings);
        },
        tabs: [
          GButton(
            icon: state.currentPage == MainPage.profile
                ? Icons.person
                : Icons.person_outline,
            text: 'Profile',
          ),
          GButton(
            icon: state.currentPage == MainPage.home
                ? Icons.home
                : Icons.home_outlined,
            text: 'Home',
          ),
          GButton(
            icon: state.currentPage == MainPage.settings
                ? Icons.settings
                : Icons.settings_outlined,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
