import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMenuItem(
          text: 'Select Language',
          isHeader: true,
        ),
        _buildMenuItem(
          text: 'English',
        ),
        _buildMenuItem(
          text: 'Polski',
        ),
        _buildMenuItem(
          text: 'Deutsch',
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required String text,
    bool isHeader = false,
  }) {
    return Container(
      color: isHeader ? AppColors.button : AppColors.niceWhite,
      height: 50,
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: isHeader
                ? AppText.smallHeader
                : AppText.smaller.copyWith(
                    fontSize: 15,
                    color: AppColors.button,
                  ),
          ),
        ],
      ),
    );
  }
}
