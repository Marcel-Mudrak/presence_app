import 'package:flutter/material.dart';
import 'package:presence_app/common/widget/bottom_sheet/bottom_sheet.dart';
import 'package:presence_app/screen/main/pages/home/state/home_page_state.dart';
import 'package:presence_app/screen/main/pages/home/view/home_page_view.dart';
import 'package:utopia_arch/utopia_arch.dart';

class HomePage extends HookWidget {
  // static const route = '/home';
  // static final routeConfig = RouteConfig.material(HomePage.new);

  const HomePage();

  @override
  Widget build(BuildContext context) {
    final state = useHomePageState(
      showNfcBottomSheet: (courseName, isScanPossible) async => CustomBottomSheet.show(
        context,
        courseName: courseName,
        isScanPossible: isScanPossible,
      ),
    );
    return HomePageView(state: state);
  }
}
