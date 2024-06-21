import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:utopia_arch/utopia_arch.dart';

final appTheme = ThemeData(
  primaryColor: AppColors.primary,
  textSelectionTheme:
      const TextSelectionThemeData(selectionHandleColor: AppColors.niceWhite),
  appBarTheme: AppBarTheme(systemOverlayStyle: RouteConfig.darkTop),
);
