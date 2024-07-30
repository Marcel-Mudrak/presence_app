import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:presence_app/models/presence/presence.dart';

class FirebaseService {
  static const userPresenceCollection = 'userPresence';

  Future<void> addPresence(
    Presence? presence,
    String userId,
  ) async =>
      FirebaseFirestore.instance.collection(userPresenceCollection).add(
        {
          'user': userId,
          'date': presence?.subject.date ?? DateTime.now(),
          'course': presence?.subject.courseName ?? '',
          'wasPresent': presence?.wasPresent ?? false,
        },
      );

  Future<void> signIn() async => FirebaseAuth.instance.signInAnonymously();
}
