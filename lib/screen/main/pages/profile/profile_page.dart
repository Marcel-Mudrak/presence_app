import 'package:flutter/material.dart';
import 'package:presence_app/screen/main/pages/profile/state/profile_page_state.dart';
import 'package:presence_app/screen/main/pages/profile/view/profile_page_view.dart';
import 'package:utopia_arch/utopia_arch.dart';

class ProfilePage extends HookWidget {
  // static const route = '/profile';
  // static final routeConfig = RouteConfig.material(ProfilePage._);

  const ProfilePage();
  @override
  Widget build(BuildContext context) {
    final state = useProfileScreenState();
    return ProfilePageView(state: state);
  }
}
