import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sheet_localization/flutter_sheet_localization.dart';

part 'app_localizations.g.dart';

// TODO Add localizations sheet
// https://docs.google.com/spreadsheets/d/1IDd4P2xe6swF0vOYeGnLes_UWxgA1Upni5TNDClh9Pg/edit#gid=0
@SheetLocalization("1IDd4P2xe6swF0vOYeGnLes_UWxgA1Upni5TNDClh9Pg", "0", 1)
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizationsData> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => localizedLabels.containsKey(locale);

  @override
  Future<AppLocalizationsData> load(Locale locale) => SynchronousFuture<AppLocalizationsData>(localizedLabels[locale]!);

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
