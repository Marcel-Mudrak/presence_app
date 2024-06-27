import 'package:presence_app/app/state/schedule_state/schedule_state.dart';
import 'package:presence_app/models/subject/subject.dart';
import 'package:presence_app/models/subjects_with_period/subjects_with_period.dart';
import 'package:utopia_arch/utopia_arch.dart';

class ProfilePageState {
  const ProfilePageState({
    required this.searchFieldState,
    required this.subjectsWithPeriodList,
    required this.todayClasses,
  });

  final FieldState searchFieldState;
  final List<SubjectsWithPeriod> subjectsWithPeriodList;
  final List<Subject> todayClasses;
}

ProfilePageState useProfilePageState() {
  final searchFieldState = useFieldState();
  useEffect(() {}, [searchFieldState.value]);

  final scheduleState = useProvided<ScheduleState>();

  return ProfilePageState(
    searchFieldState: searchFieldState,
    subjectsWithPeriodList: scheduleState.subjectsWithPeriodList,
    todayClasses: scheduleState.subjectsWithPeriodList[0].subjects
        .where(
          (element) => element.date.isAfter(DateTime.now()),
        )
        .toList(),
  );
}
