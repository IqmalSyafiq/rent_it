import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenancy_document.freezed.dart';
part 'tenancy_document.g.dart';

@freezed
class TenancyDocument with _$TenancyDocument {
  factory TenancyDocument({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'tenancy_id') required String tenancyId,
    @JsonKey(name: 'document_name') required String documentName,
    @JsonKey(name: 'upload_date') required int uploadDate,
    @JsonKey(name: 'document_url') required String documentUrl,
  }) = _TenancyDocument;

  factory TenancyDocument.fromJson(Map<String, dynamic> json) => _$TenancyDocumentFromJson(json);

  factory TenancyDocument.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return TenancyDocument.fromJson(data);
  }
}
