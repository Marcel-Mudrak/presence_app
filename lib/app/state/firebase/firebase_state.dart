import 'package:firebase_core/firebase_core.dart';
import 'package:presence_app/firebase_options.dart';
import 'package:utopia_arch/utopia_arch.dart';
import 'package:utopia_firebase_crashlytics/utopia_firebase_crashlytics.dart';

class FirebaseState extends HasInitialized {
  const FirebaseState({required super.isInitialized});
}

FirebaseState useFirebaseState() {
  final state = useAutoComputedState(() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await UtopiaFirebaseCrashlytics.setup();
  });

  return FirebaseState(isInitialized: state.value is ComputedStateValueReady);
}
