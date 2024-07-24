import 'package:presence_app/app/state/nfc/nfc_state.dart';
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
    required this.decodedMessage,
    required this.onRegisterPresencePressed,
  });

  final FieldState searchFieldState;
  final List<SubjectsWithPeriod> subjectsWithPeriodList;
  final List<Subject> todayLaterClasses;
  final void Function() onRegisterPresencePressed;

  final String? decodedMessage;
}

HomePageState useHomePageState({
  required void Function(
    String courseName,
    bool? isCardScanned,
    bool isScanPossible,
  ) showNfcBottomSheet,
}) {
  final searchFieldState = useFieldState();
  useEffect(() {}, [searchFieldState.value]);

  final scheduleState = useProvided<ScheduleState>();

  final nfcState = useProvided<NfcState>();

  final todayLaterClasses = scheduleState.subjectsWithPeriodList[1].subjects
      .where(
        (element) => element.date.isToday && element.dateEnd.isAfter(DateTime.now()),
      )
      .toList();

  return HomePageState(
    searchFieldState: searchFieldState,
    subjectsWithPeriodList: scheduleState.subjectsWithPeriodList,
    todayLaterClasses: todayLaterClasses,
    decodedMessage: nfcState.decodedMessage,
    onRegisterPresencePressed: () => showNfcBottomSheet(
      todayLaterClasses.isNotEmpty ? todayLaterClasses[0].courseName : '',
      nfcState.decodedMessage?.endsWith('en1'),
      todayLaterClasses.isNotEmpty &&
          todayLaterClasses.isNotEmpty &&
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
              ),
    ),
  );
}
