import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

extension DateExtensions on DateTime {
  String toDisplayString() {
    initializeDateFormatting();
    final dateFormat = DateFormat("dd.MM.yyyy", 'pl');
    return dateFormat.format(this);
  }
}