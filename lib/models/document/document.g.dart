// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentImpl _$$DocumentImplFromJson(Map<String, dynamic> json) =>
    _$DocumentImpl(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      receiverId: json['receiver_id'] as String,
      type: $enumDecodeNullable(_$DocumentTypeEnumMap, json['type']) ??
          DocumentType.rentalAgreement,
      documentRef: json['document_ref'] as String,
      createdAt: json['created_at'] as int,
    );

Map<String, dynamic> _$$DocumentImplToJson(_$DocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'receiver_id': instance.receiverId,
      'type': _$DocumentTypeEnumMap[instance.type],
      'document_ref': instance.documentRef,
      'created_at': instance.createdAt,
    };

const _$DocumentTypeEnumMap = {
  DocumentType.rentalAgreement: 'rentalAgreement',
  DocumentType.quitNotice: 'quitNotice',
};
