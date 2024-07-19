import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:utopia_arch/utopia_arch.dart';

class AppFieldThemeData {
  final TextStyle style, labelStyle, errorStyle, hintStyle;
  final BoxDecoration decoration;
  final EdgeInsets textPadding;

  const AppFieldThemeData({
    required this.style,
    required this.labelStyle,
    required this.errorStyle,
    required this.hintStyle,
    required this.decoration,
    required this.textPadding,
  });

  AppFieldThemeData copyWith({
    TextStyle? style,
    TextStyle? labelStyle,
    TextStyle? errorStyle,
    TextStyle? hintStyle,
    BoxDecoration? decoration,
    EdgeInsets? textPadding,
  }) {
    return AppFieldThemeData(
      style: style ?? this.style,
      labelStyle: labelStyle ?? this.labelStyle,
      errorStyle: errorStyle ?? this.errorStyle,
      hintStyle: hintStyle ?? this.hintStyle,
      decoration: decoration ?? this.decoration,
      textPadding: textPadding ?? this.textPadding,
    );
  }

  static final standard = AppFieldThemeData(
    style: AppText.small,
    labelStyle: AppText.inputLabel,
    errorStyle: AppText.inputLabel.copyWith(color: AppColors.error),
    hintStyle: AppText.inputHint,
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      color: AppColors.button.withOpacity(0.8),
    ),
    textPadding: const EdgeInsets.all(16),
  );
}

class AppFieldTheme extends StatelessWidget {
  final Widget child;
  final AppFieldThemeData Function(AppFieldThemeData) transform;

  const AppFieldTheme.transform({super.key, required this.child, required this.transform});

  AppFieldTheme({super.key, required this.child, required AppFieldThemeData theme}) : transform = ((_) => theme);

  static AppFieldThemeData of(BuildContext context) => AppFieldThemeData.standard;

  @override
  Widget build(BuildContext context) => ValueProvider(transform(of(context)), child: child);
}
