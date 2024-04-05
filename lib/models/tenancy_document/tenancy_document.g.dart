// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tenancy_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TenancyDocumentImpl _$$TenancyDocumentImplFromJson(
        Map<String, dynamic> json) =>
    _$TenancyDocumentImpl(
      id: json['id'] as String,
      tenancyId: json['tenancy_id'] as String,
      documentName: json['document_name'] as String,
      uploadDate: json['upload_date'] as int,
      documentUrl: json['document_url'] as String,
    );

Map<String, dynamic> _$$TenancyDocumentImplToJson(
        _$TenancyDocumentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenancy_id': instance.tenancyId,
      'document_name': instance.documentName,
      'upload_date': instance.uploadDate,
      'document_url': instance.documentUrl,
    };
