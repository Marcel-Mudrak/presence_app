import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(64),
        color: AppColors.button,
      ),
      child: const Padding(
        padding: EdgeInsets.all(6),
        child: GNav(
          iconSize: 20,
          color: AppColors.niceWhite,
          activeColor: AppColors.niceWhite,
          selectedIndex: 1,
          textStyle: AppText.smaller,
          gap: 8,
          tabBackgroundColor: AppColors.washedFlatOrange,
          padding: EdgeInsets.all(20),
          tabs: [
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
      ),
    );
  }
}
