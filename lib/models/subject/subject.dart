import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject.freezed.dart';
part 'subject.g.dart';

@freezed
class Subject with _$Subject {
  Subject._();

  factory Subject({
    required DateTime date,
    required DateTime dateEnd,
    required String day,
    required String courseName,
    required String courseType,
    required String teacher,
    String? room,
  }) = _Subject;

  factory Subject.fromJson(Map<String, dynamic> json) => _$SubjectFromJson(json);
}
