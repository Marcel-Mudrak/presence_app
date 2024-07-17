import 'package:flutter/cupertino.dart';

class AppColors {
  const AppColors._();

  static const primary = Color(0xFFEE6213);
  static const secondary = Color(0xFFB87953);

  static const niceBlue = Color(0xFFA2C2C2);
  static const whiteBlue = Color(0xFFBCC8C3);
  static const niceWhite = Color(0xFFF1F1F1);

  static const flatOrange = Color(0xFFFF893F);
  static const washedFlatOrange = Color(0xFFFF8F4B);
  static const washedFlatOrangeDark = Color(0xFFD8793F);
  static const washedFlatOrangeDarker = Color(0xFFAE6333);

  static const greyBlue = Color(0xFF5B6B69);
  static const button = Color(0xFF212121);

  static const error = Color(0xFFFF2B2B);
  static const textPrimary = Color(0xFF2F353B);
  static const textSecondary = Color(0xFF8A94A6);

  static const gradientPrimary = LinearGradient(
    colors: [
      greyBlue,
      button,
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
