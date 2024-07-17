import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_images.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:utopia_arch/utopia_arch.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    this.pageName = '',
    this.backIcon = false,
  });

  final String? pageName;
  final bool backIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (backIcon)
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.navigator.pop();
            },
            child: const Icon(
              Icons.arrow_back,
              color: AppColors.niceWhite,
              size: 32,
            ),
          )
        else
          Image.asset(
            AppImages.logo,
            scale: 10,
          ),
        if (!backIcon)
          const SizedBox(
            height: 30,
            child: VerticalDivider(
              color: AppColors.niceWhite,
              width: 15,
              thickness: 1,
            ),
          ),
        if (!backIcon)
          Text(
            pageName!,
            style: AppText.appBarTitle,
          ),
      ],
    );
  }
}
