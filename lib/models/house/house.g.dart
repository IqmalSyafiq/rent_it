// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseImpl _$$HouseImplFromJson(Map<String, dynamic> json) => _$HouseImpl(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      address: json['address'] as String,
      numRooms: json['num_rooms'] as num,
      bathrooms: json['num_bathrooms'] as num,
      monthlyRent: (json['monthly_rent'] as num).toDouble(),
      description: json['description'] as String?,
      imageUrl: (json['image_url'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$HouseImplToJson(_$HouseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'address': instance.address,
      'num_rooms': instance.numRooms,
      'num_bathrooms': instance.bathrooms,
      'monthly_rent': instance.monthlyRent,
      'description': instance.description,
      'image_url': instance.imageUrl,
    };
