import 'package:flutter/material.dart';
import 'package:presence_app/common/widget/custom_app_bar.dart';
import 'package:presence_app/screen/main/pages/settings/state/settings_page_state.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({required this.state});

  final SettingsPageState state;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomAppBar(
          pageName: 'Settings',
        ),
      ],
    );
  }
}
