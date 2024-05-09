import 'package:flutter/cupertino.dart';
import 'package:presence_app/common/constant/app_colors.dart';

class AppText {
  const AppText._();

  static const mainHeader = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
    color: AppColors.niceWhite,
    letterSpacing: -3,
    fontSize: 36,
    height: 1,
  );

  static const secondaryHeader = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: AppColors.niceWhite,
    letterSpacing: -2,
    fontSize: 28,
    height: 1,
  );

  static const small = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    color: AppColors.niceBlue,
    fontSize: 16,
  );

  static const smaller = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    color: AppColors.niceWhite,
    fontSize: 13,
  );

  static const smallest = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    color: AppColors.niceWhite,
    fontSize: 11,
    height: 1,
  );

  static const time = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    color: AppColors.niceWhite,
    fontSize: 24,
  );
  static const date = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
    color: AppColors.niceBlue,
    fontSize: 11,
  );

  static const appBarTitle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w300,
    color: AppColors.niceWhite,
    fontSize: 28,
  );

  static const input = TextStyle();

  static const inputLabel = TextStyle();

  static final inputHint = input.copyWith(color: AppColors.textSecondary);
}
