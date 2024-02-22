import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification.freezed.dart';
part 'notification.g.dart';

@freezed
class Notification with _$Notification {
  factory Notification({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'report_id') required String reportId,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'body') String? body,
    @JsonKey(name: 'payload') Map<String, dynamic>? payload,
    @Default(false) @JsonKey(name: 'is_read') bool? isRead,
    @JsonKey(name: 'created_at') required int createdAt,
  }) = _Notification;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  factory Notification.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return Notification.fromJson(data);
  }
}
