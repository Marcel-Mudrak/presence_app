import 'package:cloud_firestore/cloud_firestore.dart';

extension DocumentReferenceX on DocumentReference<Map<String, dynamic>> {
  DocumentReference<T> withJsonConverter<T>(
    T Function(Map<String, dynamic> json) fromJson,
    Map<String, dynamic> Function(T value) toJson,
  ) {
    return withConverter(
      fromFirestore: (snapshot, _) => fromJson(snapshot.data()!),
      toFirestore: (value, _) => toJson(value),
    );
  }
}
