import 'package:flutter/material.dart';
import 'package:presence_app/screen/main/pages/profile/state/profile_page_state.dart';
import 'package:presence_app/screen/main/pages/profile/view/profile_page_view.dart';
import 'package:utopia_arch/utopia_arch.dart';

class ProfileScreen extends HookWidget {
  static const route = '/profile';
  static final routeConfig = RouteConfig.material(ProfileScreen._);

  const ProfileScreen._();
  @override
  Widget build(BuildContext context) {
    final state = useProfileScreenState();
    return ProfileScreenView(state: state);
  }
}
