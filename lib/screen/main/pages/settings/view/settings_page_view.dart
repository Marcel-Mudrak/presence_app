import 'package:flutter/material.dart';
import 'package:presence_app/common/constant/app_colors.dart';
import 'package:presence_app/common/constant/app_text.dart';
import 'package:presence_app/common/widget/app_bar/custom_app_bar.dart';
import 'package:presence_app/screen/main/pages/settings/state/settings_page_state.dart';
import 'package:utopia_arch/utopia_arch.dart';

class SettingsPageView extends StatelessWidget {
  const SettingsPageView({required this.state});

  final SettingsPageState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(
          pageName: 'Settings',
        ),
        Expanded(
          flex: 4,
          child: ListView(
            children: [
              const SizedBox(height: 8),
              _buildSettingItem(
                settingName: 'Language',
                settingDescription: 'Change the application language',
              ),
              _buildSettingItem(
                settingName: 'Group',
                settingDescription: 'Change your student group',
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: _buildSettingItem(
                        settingName: 'Help',
                        extraItem: true,
                        icon: Icons.contact_support,
                      ),
                    ),
                  ),
                  Expanded(
                    child: _buildSettingItem(
                      settingName: 'Contact',
                      extraItem: true,
                      icon: Icons.email,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: _buildSettingItem(
                        settingName: 'Credits',
                        extraItem: true,
                        icon: Icons.person_pin_sharp,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildSettingItem(
                      settingName: 'Logout',
                      extraItem: true,
                      icon: Icons.logout,
                    ),
                  ),
                ],
              ),
            ].separatedWith(
              Container(height: 8),
            ),
          ),
        ),
      ],
    );
  }

  Container _buildSettingItem({
    required String settingName,
    String? settingDescription,
    bool extraItem = false,
    IconData? icon,
  }) {
    return Container(
      padding: extraItem ? const EdgeInsets.all(8) : const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: extraItem ? AppColors.button.withOpacity(0.8) : AppColors.button,
      ),
      child: Column(
        crossAxisAlignment: extraItem ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          if (extraItem) ...[
            Icon(
              icon,
              color: AppColors.niceWhite,
            ),
            const SizedBox(height: 4),
          ],
          Text(
            settingName,
            style: extraItem ? AppText.smaller : AppText.smallHeader,
          ),
          if (settingDescription != null) ...[
            const SizedBox(height: 4),
            Text(
              settingDescription,
              style: AppText.smaller.copyWith(
                color: AppColors.niceWhite.withOpacity(0.6),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
