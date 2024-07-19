import 'dart:convert';

import 'package:chaleno/chaleno.dart';
import 'package:presence_app/models/subject/subject.dart';
import 'package:presence_app/models/subjects_with_period/subjects_with_period.dart';

class UekScheduleService {
  static const uekUrl = 'https://planzajec.uek.krakow.pl/index.php?typ=G&id=240351&okres=';

  Future<List<SubjectsWithPeriod>?> getSubjectsWithPeriod() async {
    final List<SubjectsWithPeriod> schedule = [];

    for (var period = 1; period <= 5; period++) {
      final parser = await Chaleno().load('$uekUrl$period');

      final List<Result> resultData = parser?.getElementsByTagName('tr') ?? [];
      final String group = parser?.querySelector('.grupa').text ?? '';

      if (resultData.isEmpty) return null;

      final subjectListRaw = _lineSplitterParser(resultData);
      final subjectList = _getSubjectList(subjectListRaw);
      final subjectWithPeriod = SubjectsWithPeriod(
        period: period,
        subjects: subjectList,
        group: group,
      );
      schedule.add(subjectWithPeriod);
    }
    return schedule;
  }

  List<Subject> _getSubjectList(List<List<String>> subjectListRaw) {
    final List<Subject> subjectList = [];

    for (final subject in subjectListRaw) {
      /// skips legend
      if (subject[0] != 'Termin') {
        final Subject readySubject = Subject(
          date: DateTime.parse(
            subject[0],
          ).copyWith(
            minute: int.parse(subject[1].substring(6, 8)),
            hour: int.parse(subject[1].substring(3, 5)),
          ),
          dateEnd: DateTime.parse(
            subject[0],
          ).copyWith(
            minute: int.parse(subject[1].substring(14, 16)),
            hour: int.parse(subject[1].substring(11, 13)),
          ),
          day: subject[1],
          courseName: subject[2] == '' ? 'No title' : subject[2],
          courseType: subject[3],
          teacher: subject[4],
          room: subject[5],
        );
        subjectList.add(readySubject);
      }
    }
    return subjectList;
  }

  List<List<String>> _lineSplitterParser(List<Result> items) {
    final List<List<String>> subjectList = [];

    for (final item in items) {
      final List<String> parsedItem = const LineSplitter().convert(item.text!);

      /// skips subjects without required data
      if (parsedItem.length != 1) {
        parsedItem.removeAt(0);
        subjectList.add(parsedItem);
      }
    }

    return subjectList;
  }
}
