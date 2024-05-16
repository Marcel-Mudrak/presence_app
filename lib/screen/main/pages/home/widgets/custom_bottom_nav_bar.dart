import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/screen/main/pages/profile/profile_page_screen.dart';
import 'package:utopia_arch/utopia_arch.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

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
          if (index == 0) {
            await context.navigator.pushNamedAndReset(ProfileScreen.route);
          } else if (index == 1) {
            await context.navigator.pushNamedAndReset(ProfileScreen.route);
          } else if (index == 2) {
            print("TODO");
          }
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
