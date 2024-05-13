import 'package:flutter/widgets.dart';
import 'package:presence_app/app/app_localizations.dart';

extension AppContextExtensions on BuildContext {
  AppLocalizationsData get strings => Localizations.of(this, AppLocalizationsData)!;
}
