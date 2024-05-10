import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_images.dart';
import 'package:presence_app/common/constant/app_text.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

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
        const Text('Presence App', style: AppText.appBarTitle),
        const Spacer(),
        const Icon(
          Icons.language,
          color: AppColors.niceWhite,
        )
      ],
    );
  }
}
