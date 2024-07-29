import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  static const userPresenceCollection = 'userPresence';

  // Future<void> incrementReactions(DateTime timestamp) async =>
  //     FirebaseFirestore.instance.collection(insultsCollection).doc(timestamp.atDayStartToEpochString()).update({
  //       insultsLikeField: FieldValue.increment(1),
  //     });

  // Future<UserPresence> fetchInsults(DateTime timestamp) async {
  //   final doc = await FirebaseFirestore.instance.collection(userPresenceCollection).get();
  //   final result = doc.;
  //
  //   return result;
  // }

  Future<void> signIn() async => FirebaseAuth.instance.signInAnonymously();
}
