// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenancy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TenancyImpl _$$TenancyImplFromJson(Map<String, dynamic> json) =>
    _$TenancyImpl(
      id: json['id'] as String,
      tenantId: json['tenant_id'] as String,
      houseId: json['house_id'] as String,
      startDate: json['start_date'] as int,
      endDate: json['end_date'] as int,
      rentAmount: json['rent_amount'] as num,
      createdAt: json['created_at'] as int?,
      isActive: json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$$TenancyImplToJson(_$TenancyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'house_id': instance.houseId,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'rent_amount': instance.rentAmount,
      'created_at': instance.createdAt,
      'is_active': instance.isActive,
    };
