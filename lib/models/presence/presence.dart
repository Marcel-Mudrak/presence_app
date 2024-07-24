import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presence_app/models/subject/subject.dart';

part 'presence.freezed.dart';
part 'presence.g.dart';

@freezed
class Presence with _$Presence {
  Presence._();

  factory Presence({
    required Subject subject,
    required bool wasPresent,
  }) = _Presence;

  factory Presence.fromJson(Map<String, dynamic> json) => _$PresenceFromJson(json);
}
