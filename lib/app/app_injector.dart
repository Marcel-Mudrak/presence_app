import 'package:injector/injector.dart';
import 'package:presence_app/app/app_config.dart';
import 'package:presence_app/service/firebase/firebase_service.dart';
import 'package:presence_app/service/uek/uek_schedule_service.dart';
import 'package:utopia_arch/utopia_arch.dart';

class AppInjector {
  const AppInjector._();

  static Injector setup() {
    final injector = Injector();
    injector
      ..registerSingleton(() => AppConfig.current)
      ..registerSingleton(PreferencesService.new)
      ..registerSingleton(UekScheduleService.new)
      ..registerSingleton(FirebaseService.new);
    return injector;
  }
}
