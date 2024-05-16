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
      padding: const EdgeInsets.all(6),
      color: AppColors.button,
      child: GNav(
        iconSize: 20,
        color: AppColors.niceWhite,
        activeColor: AppColors.niceWhite,
        selectedIndex: 1,
        textStyle: AppText.smaller,
        gap: 8,
        tabBackgroundColor: AppColors.washedFlatOrange,
        padding: const EdgeInsets.all(20),
        onTabChange: (index) async {
          if (index == 0) state.onPageChanged(MainPage.profile);
          if (index == 1) state.onPageChanged(MainPage.home);
          // if (index == 2) state.onPageChanged(MainPage.settings);
        },
        tabs: const [
          GButton(
            icon: Icons.person,
            text: 'Profile',
          ),
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ],
      ),
    );
  }
}
