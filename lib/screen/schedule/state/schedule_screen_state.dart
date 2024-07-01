import 'package:flutter/material.dart';
import 'package:presence_app/app/state/schedule_state/schedule_state.dart';
import 'package:presence_app/models/subjects_with_period/subjects_with_period.dart';
import 'package:utopia_arch/utopia_arch.dart';

class ScheduleScreenState {
  const ScheduleScreenState({
    required this.subjectsWithPeriodList,
    required this.searchFieldState,
    required this.chosenDateRangeState,
  });

  final FieldState searchFieldState;
  final List<SubjectsWithPeriod> subjectsWithPeriodList;
  final ListenableMutableValue<DateTimeRange?> chosenDateRangeState;
}

ScheduleScreenState useScheduleScreenState() {
  final searchFieldState = useFieldState();
  final scheduleState = useProvided<ScheduleState>();

  final dateRangeState = useState<DateTimeRange?>(
    DateTimeRange(
      start: DateTime.now().subtract(const Duration(days: 90)),
      end: DateTime.now(),
    ),
  );

  return ScheduleScreenState(
    searchFieldState: searchFieldState,
    subjectsWithPeriodList: scheduleState.subjectsWithPeriodList,
    chosenDateRangeState: dateRangeState,
  );
}
