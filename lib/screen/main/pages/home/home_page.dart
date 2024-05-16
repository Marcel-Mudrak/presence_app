import 'package:flutter/material.dart';
import 'package:presence_app/screen/main/pages/home/state/home_page_state.dart';
import 'package:presence_app/screen/main/pages/home/view/home_page_view.dart';
import 'package:presence_app/screen/main/pages/profile/profile_page_screen.dart';
import 'package:utopia_arch/utopia_arch.dart';

class HomePage extends HookWidget {
  static const route = '/home';
  static final routeConfig = RouteConfig.material(HomePage.new);

  const HomePage();

  @override
  Widget build(BuildContext context) {
    final state = useHomeScreenState(
      moveToProfile: () async =>
          context.navigator.pushReplacementNamed(ProfileScreen.route),
    );
    return HomeScreenView(state: state);
  }
}
