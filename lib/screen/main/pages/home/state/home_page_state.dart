import 'dart:io';

import 'package:presence_app/app/app_reporter.dart';
import 'package:presence_app/app/state/nfc/nfc_state.dart';
import 'package:presence_app/app/state/schedule_state/schedule_state.dart';
import 'package:presence_app/models/presence/presence.dart';
import 'package:presence_app/models/subject/subject.dart';
import 'package:presence_app/models/subjects_with_period/subjects_with_period.dart';
import 'package:presence_app/service/firebase/firebase_service.dart';
import 'package:utopia_arch/utopia_arch.dart';

class HomePageState {
  const HomePageState({
    required this.searchFieldState,
    required this.subjectsWithPeriodList,
    required this.todayLaterClasses,
    required this.onRegisterPresencePressed,
    required this.isCardScanned,
  });

  final FieldState searchFieldState;
  final List<SubjectsWithPeriod> subjectsWithPeriodList;
  final List<Subject> todayLaterClasses;
  final bool isCardScanned;

  final Future<void> Function() onRegisterPresencePressed;
}

HomePageState useHomePageState({
  required Future<bool?> Function(
    String courseName,
    bool isScanPossible,
    Future<Presence?> Function({required bool isPresent}) registerPresence,
  ) showNfcBottomSheet,
}) {
  final searchFieldState = useFieldState();
  useEffect(() {}, [searchFieldState.value]);

  final scheduleState = useProvided<ScheduleState>();
  final firebaseService = useInjected<FirebaseService>();

  // final todayLaterClasses = scheduleState.subjectsWithPeriodList[1].subjects
  //     .where(
  //       (element) => element.date.isToday && element.dateEnd.isAfter(DateTime.now()),
  //     )
  //     .toList();

  // TODO delete (debug)
  final todayLaterClasses = scheduleState.subjectsWithPeriodList[1].subjects
      .where(
        (element) => element.dateEnd.isBefore(DateTime.now()),
      )
      .toList();

  // final bool isClassNow = todayLaterClasses.isNotEmpty &&
  //     todayLaterClasses[0]
  //         .date
  //         .subtract(
  //           const Duration(minutes: 15),
  //         )
  //         .isBefore(
  //           DateTime.now(),
  //         ) &&
  //     todayLaterClasses[0]
  //         .dateEnd
  //         .add(
  //           const Duration(minutes: 15),
  //         )
  //         .isAfter(
  //           DateTime.now(),
  //         );

  // TODO delete (debug)
  const bool isClassNow = true;

  Future<Presence?> registerPresence({required bool isPresent}) async {
    if (isClassNow && isPresent) {
      final presence = Presence(
        subject: todayLaterClasses[0],
        wasPresent: true,
      );
      await firebaseService.addPresence(presence, 'user1');
      return presence;
    } else if (isClassNow && !isPresent) {
      final presence = Presence(
        subject: todayLaterClasses[0],
        wasPresent: false,
      );
      await firebaseService.addPresence(presence, 'user1');
      return presence;
    }
    return null;
  }

  final isScanningEnabled = useState(false);
  final isCardScannedState = useState(false);

  Future<void> onRegisterPresencePressed() async {
    if (Platform.isIOS && todayLaterClasses.isNotEmpty && !isCardScannedState.value) {
      isScanningEnabled.value = true;
    } else if (!isCardScannedState.value) {
      final result = await showNfcBottomSheet(
        todayLaterClasses.isNotEmpty ? todayLaterClasses[0].courseName : 'Empty',
        isClassNow,
        registerPresence,
      );
      if (result ?? false) {
        isCardScannedState.value = true;
      }
    }
  }

  useIf(
    isScanningEnabled.value,
    () {
      final nfcState = useNfcState();

      useStreamSubscription(
        nfcState.tagsStream,
        (tag) async {
          // ...
          appReporter.info(tag);
          if (tag.endsWith('en1')) {
            isCardScannedState.value = true;
            isScanningEnabled.value = false;
            await registerPresence(isPresent: true);
          }
        },
      );
    },
  );

  return HomePageState(
    searchFieldState: searchFieldState,
    subjectsWithPeriodList: scheduleState.subjectsWithPeriodList,
    todayLaterClasses: todayLaterClasses,
    isCardScanned: isCardScannedState.value,
    onRegisterPresencePressed: onRegisterPresencePressed,
  );
}
