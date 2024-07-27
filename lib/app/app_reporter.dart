import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_firebase_crashlytics/utopia_firebase_crashlytics.dart';

final appReporter = Reporter.combined([
  LoggerReporter.standard(),
  const CrashlyticsReporter(),
]);
