import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'house.freezed.dart';
part 'house.g.dart';

@freezed
class House with _$House {
  factory House({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'owner_id') required String ownerId,
    @JsonKey(name: 'address') required String address,
    @JsonKey(name: 'num_rooms') required num numRooms,
    @JsonKey(name: 'num_bathrooms') required num bathrooms,
    @JsonKey(name: 'monthly_rent') required double monthlyRent,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'image_url') List<String>? imageUrl,
  }) = _House;

  factory House.fromJson(Map<String, dynamic> json) => _$HouseFromJson(json);

  factory House.fromFirestore(DocumentSnapshot<Map<String, Object?>> document) {
    final data = document.data();
    data!['id'] = document.id;

    return House.fromJson(data);
  }
}
