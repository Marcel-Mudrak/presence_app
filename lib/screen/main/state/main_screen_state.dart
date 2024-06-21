import 'dart:convert';

import 'package:chaleno/chaleno.dart';
import 'package:flutter/material.dart';
import 'package:presence_app/screen/main/pages/home/home_page.dart';
import 'package:presence_app/screen/main/pages/profile/profile_page.dart';
import 'package:presence_app/screen/main/pages/settings/settings_page.dart';
import 'package:utopia_arch/utopia_arch.dart';

enum MainPage {
  home(HomePage.new, Icons.home),
  profile(ProfilePage.new, Icons.person),
  settings(SettingsPage.new, Icons.settings);

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

  Future<List<List<String>>> getDataFromUek() async {
    final parser = await Chaleno().load(
        'https://planzajec.uek.krakow.pl/index.php?typ=G&id=240351&okres=5');

    final List<Result> results = parser?.getElementsByTagName('tr') ?? [];

    final List<List<String>> r = [];
    final List<List<String>> schedule = [];

    if (results.isNotEmpty) {
      for (final result in results) {
        final List<String> parsedResult =
            const LineSplitter().convert(result.text!);

        if (parsedResult.length != 1) {
          r.add(parsedResult);
        }
      }
      for (final subject in r) {
        if (subject[1] != 'Termin') {
          schedule.add(subject..removeLast()..removeAt(0));
        }
      }
    }
    return schedule;
  }

  print(getDataFromUek());

  return MainScreenState(
    currentPage: pageState.value,
    onPageChanged: (page) => pageState.value = page,
  );
}
