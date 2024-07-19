import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presence_app/models/subject/subject.dart';

part 'subjects_with_period.freezed.dart';
part 'subjects_with_period.g.dart';

@freezed
class SubjectsWithPeriod with _$SubjectsWithPeriod {
  SubjectsWithPeriod._();

  factory SubjectsWithPeriod({
    required int period,
    required String group,
    required List<Subject> subjects,
  }) = _SubjectsWithPeriod;

  factory SubjectsWithPeriod.fromJson(Map<String, dynamic> json) => _$SubjectsWithPeriodFromJson(json);
}
