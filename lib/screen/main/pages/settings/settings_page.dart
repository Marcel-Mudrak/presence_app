import 'package:flutter/material.dart';
import 'package:presence_app/screen/main/pages/settings/state/settings_page_state.dart';
import 'package:presence_app/screen/main/pages/settings/view/settings_page_view.dart';
import 'package:utopia_arch/utopia_arch.dart';

class SettingsPage extends HookWidget {

  const SettingsPage();
  @override
  Widget build(BuildContext context) {
    final state = useSettingsPageState();
    return SettingsPageView(state: state);
  }
}
