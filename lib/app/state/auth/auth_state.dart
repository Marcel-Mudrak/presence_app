import 'package:presence_app/app/state/firebase/firebase_state.dart';
import 'package:presence_app/service/firebase/firebase_service.dart';
import 'package:utopia_arch/utopia_arch.dart';

class AuthState extends HasInitialized {
  const AuthState({required super.isInitialized});

  // final Insult? insultOrNull;
  //
  // Insult  get insult => insultOrNull!;
}

AuthState useAuthState() {
  final firebaseState = useProvided<FirebaseState>();
  final firebaseService = useInjected<FirebaseService>();

  final state = useAutoComputedState(
    () async {
      if (firebaseState.isInitialized) {
        return firebaseService.signIn();
      }
    },
    keys: [firebaseState.isInitialized],
  );

  // final insultState = useAutoComputedState(
  //       () async {
  //     if (firebaseState.isInitialized) {
  //       return firebaseService.fetchInsults(DateTime.now());
  //     }
  //   },
  //   keys: [firebaseState.isInitialized],
  // );

  return AuthState(
    isInitialized: state.value is ComputedStateValueReady,
  );
}
