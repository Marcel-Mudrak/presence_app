import 'package:presence_app/app/app_reporter.dart';
import 'package:presence_app/app/state/schedule_state/schedule_state.dart';
import 'package:presence_app/models/subject/subject.dart';
import 'package:presence_app/models/subjects_with_period/subjects_with_period.dart';
import 'package:presence_app/util/extension/date_extensions.dart';
import 'package:utopia_arch/utopia_arch.dart';

class HomePageState {
  const HomePageState({
    required this.searchFieldState,
    required this.subjectsWithPeriodList,
    required this.todayClasses,
  });

  final FieldState searchFieldState;
  final List<SubjectsWithPeriod> subjectsWithPeriodList;
  final List<Subject> todayClasses;
}

HomePageState useHomePageState() {
  final searchFieldState = useFieldState();
  useEffect(() {}, [searchFieldState.value]);

  final scheduleState = useProvided<ScheduleState>();

  useEffect(
      () => appReporter.info(scheduleState.subjectsWithPeriodList.toString()));

  // final (subjectWithPeriod in subjectsWithPeriodList)
  //       subjectWtihPeriod.period
  //       subjectWtihPeriod.subjectList

  // final dzisiejszaListaSubjectWPeriod = scheduleState.subjectsWithPeriodList
  //     .where((it) => it.subjects.any((it) => it.date == DateTime.now()));

  return HomePageState(
    searchFieldState: searchFieldState,
    subjectsWithPeriodList: scheduleState.subjectsWithPeriodList,
    todayClasses: scheduleState.subjectsWithPeriodList[0].subjects
        .where(
          (element) =>
              element.date.isToday,
        )
        .toList(),
  );
}
