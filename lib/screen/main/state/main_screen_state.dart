import 'package:flutter/material.dart';
import 'package:presence_app/screen/main/pages/home/home_page.dart';
import 'package:presence_app/screen/main/pages/profile/profile_page.dart';
import 'package:utopia_arch/utopia_arch.dart';

enum MainPage {
  home(HomePage.new, Icons.home),
  profile(ProfilePage.new, Icons.person);
  // settings(SettingsPage.new, AppIcons.settings);

  final Widget Function() builder;
  final IconData icon;

  const MainPage(this.builder, this.icon);
}

class MainScreenState {
  const MainScreenState({
    required this.onPageChanged,
    required this.currentPage,
  });

  final void Function(MainPage) onPageChanged;
  final MainPage currentPage;
}

MainScreenState useMainScreenState() {
  final pageState = useState<MainPage>(MainPage.home);

  return MainScreenState(
    currentPage: pageState.value,
    onPageChanged: (page) => pageState.value = page,
  );
}
