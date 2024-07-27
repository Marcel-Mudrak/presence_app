import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:presence_app/models/presence/presence.dart';

part 'user_presence.freezed.dart';
part 'user_presence.g.dart';

@freezed
class UserPresence with _$UserPresence {
  UserPresence._();

  factory UserPresence({
    required int userId,
    required List<Presence> presence,
  }) = _UserPresence;

  factory UserPresence.fromJson(Map<String, dynamic> json) => _$UserPresenceFromJson(json);
}
