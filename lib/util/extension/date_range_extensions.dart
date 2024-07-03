import 'package:flutter/material.dart';

extension DateRangeExtensions on DateTimeRange {
  String toDisplayString() {
    final dateString = toString();
    return '${dateString.substring(0, 10)} to ${dateString.substring(26, 36)}';
  }
}
