// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportImpl _$$ReportImplFromJson(Map<String, dynamic> json) => _$ReportImpl(
      id: json['id'] as String,
      reporterId: json['reporter_id'] as String,
      receiverId: json['receiver_id'] as String,
      houseId: json['house_id'] as String,
      status: $enumDecodeNullable(_$ReportStatusEnumMap, json['status']) ??
          ReportStatus.pending,
      type: $enumDecodeNullable(_$ReportTypeEnumMap, json['type']) ??
          ReportType.house,
      title: json['title'] as String,
      description: json['description'] as String,
      createdAt: json['created_at'] as int,
      updatedAt: json['updated_at'] as int?,
      resolvedAt: json['resolved_at'] as int?,
    );

Map<String, dynamic> _$$ReportImplToJson(_$ReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reporter_id': instance.reporterId,
      'receiver_id': instance.receiverId,
      'house_id': instance.houseId,
      'status': _$ReportStatusEnumMap[instance.status],
      'type': _$ReportTypeEnumMap[instance.type],
      'title': instance.title,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'resolved_at': instance.resolvedAt,
    };

const _$ReportStatusEnumMap = {
  ReportStatus.pending: 'pending',
  ReportStatus.resolved: 'resolved',
  ReportStatus.rejected: 'rejected',
};

const _$ReportTypeEnumMap = {
  ReportType.house: 'house',
  ReportType.others: 'others',
};
