import 'package:presence_app/models/subjects_with_period/subjects_with_period.dart';
import 'package:presence_app/service/uek/uek_schedule_service.dart';
import 'package:utopia_arch/utopia_arch.dart';

class ScheduleState extends HasInitialized {
  final List<SubjectsWithPeriod> subjectsWithPeriodList;

  const ScheduleState({
    required this.subjectsWithPeriodList,
    required super.isInitialized,
  });
}

ScheduleState useScheduleState() {
  final uekScheduleService = useInjected<UekScheduleService>();

  final state = useAutoComputedState(uekScheduleService.getSubjectsWithPeriod);

  return ScheduleState(
    subjectsWithPeriodList: state.valueOrNull ?? [],
    isInitialized: state.value is ComputedStateValueReady,
  );
}
