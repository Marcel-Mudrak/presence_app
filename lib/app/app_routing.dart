import 'package:presence_app/screen/main/main_screen.dart';
import 'package:presence_app/screen/main/pages/home/home_page.dart';
import 'package:presence_app/screen/main/pages/profile/profile_page_screen.dart';
import 'package:presence_app/screen/splash/splash_screen.dart';
import 'package:utopia_arch/utopia_arch.dart';

class AppRouting {
  static final routes = <String, RouteConfig>{
    SplashScreen.route: SplashScreen.routeConfig,
    MainScreen.route: MainScreen.routeConfig,
    HomePage.route: HomePage.routeConfig,
    ProfileScreen.route: ProfileScreen.routeConfig,
  };

  static const initialRoute = SplashScreen.route;
}
