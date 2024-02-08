import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart' show Timestamp;

class RequiredFirestoreTimestampJsonConverter
    implements JsonConverter<DateTime, Timestamp> {
  const RequiredFirestoreTimestampJsonConverter();

  @override
  DateTime fromJson(dynamic json) {
    return json != null ? (json as Timestamp).toDate() : DateTime.now();
  }

  @override
  Timestamp toJson(DateTime object) => Timestamp.fromDate(object);
}

class FirestoreTimestampJsonConverter
    implements JsonConverter<DateTime?, dynamic> {
  const FirestoreTimestampJsonConverter();

  @override
  DateTime? fromJson(dynamic json) {
    if (json is Timestamp) {
      return json.toDate();
    }
    return null;
  }

  @override
  dynamic toJson(DateTime? object) =>
      object == null ? null : Timestamp.fromDate(object);
}