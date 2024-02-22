import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'document.freezed.dart';
part 'document.g.dart';

enum DocumentType {
  rentalAgreement,
  quitNotice,
}

@freezed
class Document with _$Document {
  factory Document({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    @JsonKey(name: 'receiver_id') required String receiverId,
    @Default(DocumentType.rentalAgreement) @JsonKey(name: 'type') DocumentType? type,
    @JsonKey(name: 'document_ref') required String documentRef,
    @JsonKey(name: 'created_at') required int createdAt,
  }) = _Document;

  factory Document.fromJson(Map<String, dynamic> json) => _$DocumentFromJson(json);

  factory Document.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return Document.fromJson(data);
  }
}
