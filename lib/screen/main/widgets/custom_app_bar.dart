import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_images.dart';
import 'package:presence_app/common/constant/app_text.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    required this.pageName,
    required this.icon,
  });

  final String pageName;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          AppImages.logo,
          scale: 10,
        ),
        const SizedBox(
          height: 30,
          child: VerticalDivider(
            color: AppColors.niceWhite,
            width: 15,
            thickness: 1,
          ),
        ),
        Text(pageName, style: AppText.appBarTitle),
        const Spacer(),
        Icon(
          icon,
          size: 28,
          color: AppColors.niceWhite,
        )
      ],
    );
  }
}
