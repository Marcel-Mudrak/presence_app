import 'package:presence_app/screen/main/main_screen.dart';
import 'package:presence_app/screen/schedule/schedule_screen.dart';
import 'package:presence_app/screen/splash/splash_screen.dart';
import 'package:utopia_arch/utopia_arch.dart';

class AppRouting {
  static final routes = <String, RouteConfig>{
    SplashScreen.route: SplashScreen.routeConfig,
    MainScreen.route: MainScreen.routeConfig,
    ScheduleScreen.route: ScheduleScreen.routeConfig,
  };

  static const initialRoute = SplashScreen.route;
}
