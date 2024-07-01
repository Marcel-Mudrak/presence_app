import 'package:flutter/material.dart';
import 'package:presence_app/screen/schedule/state/schedule_screen_state.dart';
import 'package:presence_app/screen/schedule/view/schedule_screen_view.dart';
import 'package:utopia_arch/utopia_arch.dart';

class ScheduleScreen extends HookWidget {
  static const route = '/schedule';
  static final routeConfig = RouteConfig.material(ScheduleScreen._);

  const ScheduleScreen._();

  @override
  Widget build(BuildContext context) {
    final state = useScheduleScreenState();
    return ScheduleScreenView(state: state);
  }
}
