import 'package:presence_app/app/state/schedule_state/schedule_state.dart';
import 'package:presence_app/models/presence/presence.dart';
import 'package:presence_app/models/subject/subject.dart';
import 'package:presence_app/models/subjects_with_period/subjects_with_period.dart';
import 'package:presence_app/util/extension/date_extensions.dart';
import 'package:utopia_arch/utopia_arch.dart';

class HomePageState {
  const HomePageState({
    required this.searchFieldState,
    required this.subjectsWithPeriodList,
    required this.todayLaterClasses,
    required this.onRegisterPresencePressed,
    required this.currentSubjectPresence,
  });

  final FieldState searchFieldState;
  final List<SubjectsWithPeriod> subjectsWithPeriodList;
  final List<Subject> todayLaterClasses;
  final Presence? currentSubjectPresence;

  final void Function() onRegisterPresencePressed;
}

HomePageState useHomePageState({
  required void Function(
    String courseName,
    bool isScanPossible,
  ) showNfcBottomSheet,
}) {
  final searchFieldState = useFieldState();
  useEffect(() {}, [searchFieldState.value]);

  final scheduleState = useProvided<ScheduleState>();

  final todayLaterClasses = scheduleState.subjectsWithPeriodList[1].subjects
      .where(
        (element) => element.date.isToday && element.dateEnd.isAfter(DateTime.now()),
      )
      .toList();

  final bool isClassNow = todayLaterClasses.isNotEmpty &&
      todayLaterClasses[0]
          .date
          .subtract(
            const Duration(minutes: 15),
          )
          .isBefore(
            DateTime.now(),
          ) &&
      todayLaterClasses[0]
          .dateEnd
          .add(
            const Duration(minutes: 15),
          )
          .isAfter(
            DateTime.now(),
          );

  Presence? registerPresence({required bool isPresent}) {
    if (isClassNow && isPresent) {
      return Presence(
        subject: todayLaterClasses[0],
        wasPresent: true,
      );
    } else if (isClassNow && !isPresent) {
      return Presence(
        subject: todayLaterClasses[0],
        wasPresent: false,
      );
    }
    return null;
  }

  return HomePageState(
    searchFieldState: searchFieldState,
    subjectsWithPeriodList: scheduleState.subjectsWithPeriodList,
    todayLaterClasses: todayLaterClasses,
    currentSubjectPresence: registerPresence(isPresent: true),
    onRegisterPresencePressed: () => showNfcBottomSheet(
      todayLaterClasses.isNotEmpty ? todayLaterClasses[0].courseName : '',
      isClassNow,
    ),
  );
}
