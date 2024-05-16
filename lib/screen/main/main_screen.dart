import 'package:flutter/material.dart';
import 'package:presence_app/screen/main/state/main_screen_state.dart';
import 'package:presence_app/screen/main/view/main_screen_view.dart';
import 'package:utopia_arch/utopia_arch.dart';

class MainScreen extends HookWidget {
  static const route = '/main';
  static final routeConfig = RouteConfig.material(MainScreen._);

  const MainScreen._();

  @override
  Widget build(BuildContext context) {
    final state = useMainScreenState();
    return MainScreenView(state: state);
  }
}
