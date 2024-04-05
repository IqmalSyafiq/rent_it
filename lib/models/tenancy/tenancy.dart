import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tenancy.freezed.dart';
part 'tenancy.g.dart';

@freezed
class Tenancy with _$Tenancy {
  factory Tenancy({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'tenant_id') required String tenantId,
    @JsonKey(name: 'house_id') required String houseId,
    @JsonKey(name: 'start_date') required int startDate,
    @JsonKey(name: 'end_date') required int endDate,
    @JsonKey(name: 'rent_amount') required num rentAmount,
  }) = _Tenancy;

  factory Tenancy.fromJson(Map<String, dynamic> json) => _$TenancyFromJson(json);

  factory Tenancy.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return Tenancy.fromJson(data);
  }
}
