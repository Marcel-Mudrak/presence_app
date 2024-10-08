import 'package:presence_app/app/state/auth/auth_state.dart';
import 'package:presence_app/app/state/firebase/firebase_state.dart';
import 'package:presence_app/app/state/precache/image_precache_state.dart';
import 'package:presence_app/app/state/schedule_state/schedule_state.dart';
import 'package:utopia_arch/utopia_arch.dart';

class InitializationState extends HasInitialized {
  const InitializationState({required super.isInitialized});
}

InitializationState useInitializationState() {
  final states = [
    useProvided<FirebaseState>(),
    useProvided<ImagePrecacheState>(),
    useProvided<ScheduleState>(),
    useProvided<AuthState>(),
  ];

  return InitializationState(isInitialized: HasInitialized.all(states));
}
