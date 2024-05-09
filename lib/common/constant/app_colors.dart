import 'package:flutter/cupertino.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFFEE6213);
  static const secondary = Color(0xFFB87953);

  static const niceBlue = Color(0xFFAAC0BC);
  static const whiteBlue = Color(0xFFBCC8C3);
  static const niceWhite = Color(0xFFF1F1F1);
  static const flatOrange = Color(0xFFFF893F);
  static const greyBlue = Color(0xFF5B6B69);

  static const error = Color(0xFFFF2B2B);
  static const textPrimary = Color(0xFF2F353B);
  static const textSecondary = Color(0xFF8A94A6);

  static const gradientPrimary = LinearGradient(
    colors: [
      primary,
      flatOrange,
      secondary,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const gradientSecondary = LinearGradient(
    colors: [
      greyBlue,
      secondary,
      secondary,
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
