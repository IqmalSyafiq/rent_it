// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationImpl _$$NotificationImplFromJson(Map<String, dynamic> json) =>
    _$NotificationImpl(
      id: json['id'] as String,
      userId: json['user_id'] as String,
      reportId: json['report_id'] as String,
      title: json['title'] as String,
      body: json['body'] as String?,
      payload: json['payload'] as Map<String, dynamic>?,
      isRead: json['is_read'] as bool? ?? false,
      createdAt: json['created_at'] as int,
    );

Map<String, dynamic> _$$NotificationImplToJson(_$NotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'report_id': instance.reportId,
      'title': instance.title,
      'body': instance.body,
      'payload': instance.payload,
      'is_read': instance.isRead,
      'created_at': instance.createdAt,
    };
