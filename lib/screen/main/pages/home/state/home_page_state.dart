import 'package:presence_app/app/state/schedule_state/schedule_state.dart';
import 'package:presence_app/models/subject/subject.dart';
import 'package:presence_app/models/subjects_with_period/subjects_with_period.dart';
import 'package:presence_app/util/extension/date_extensions.dart';
import 'package:utopia_arch/utopia_arch.dart';

class HomePageState {
  const HomePageState({
    required this.searchFieldState,
    required this.subjectsWithPeriodList,
    required this.todayLaterClasses,
  });

  final FieldState searchFieldState;
  final List<SubjectsWithPeriod> subjectsWithPeriodList;
  final List<Subject> todayLaterClasses;
}

HomePageState useHomePageState() {
  final searchFieldState = useFieldState();
  useEffect(() {}, [searchFieldState.value]);

  final scheduleState = useProvided<ScheduleState>();

  return HomePageState(
    searchFieldState: searchFieldState,
    subjectsWithPeriodList: scheduleState.subjectsWithPeriodList,
    todayLaterClasses: scheduleState.subjectsWithPeriodList[1].subjects
        .where(
          (element) =>
              element.date.isToday && element.dateEnd.isAfter(DateTime.now()),
        )
        .toList(),
  );
}
