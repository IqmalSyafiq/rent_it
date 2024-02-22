import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'report.freezed.dart';
part 'report.g.dart';

enum ReportType {
  house,
  others
}

enum ReportStatus {
  pending,
  resolved,
  rejected
}

@freezed
class Report with _$Report {
  factory Report({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'reporter_id') required String reporterId,
    @JsonKey(name: 'receiver_id') required String receiverId,
    @JsonKey(name: 'house_id') required String houseId,
    @Default(ReportStatus.pending) @JsonKey(name: 'status') ReportStatus? status,
    @Default(ReportType.house) @JsonKey(name: 'type') ReportType? type,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'description') required String description,
    @JsonKey(name: 'created_at') required int createdAt,
    @JsonKey(name: 'updated_at') int? updatedAt,
    @JsonKey(name: 'resolved_at') int? resolvedAt,
  }) = _Report;

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  factory Report.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return Report.fromJson(data);
  }
}
