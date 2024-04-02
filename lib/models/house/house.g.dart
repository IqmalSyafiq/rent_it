// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseImpl _$$HouseImplFromJson(Map<String, dynamic> json) => _$HouseImpl(
      id: json['id'] as String,
      ownerId: json['owner_id'] as String,
      addressLineOne: json['address_line_one'] as String,
      addressLineTwo: json['address_line_two'] as String?,
      postCode: json['postcode'] as num,
      city: json['city'] as String,
      state: json['state'] as String,
      numRooms: json['num_rooms'] as num,
      bathrooms: json['num_bathrooms'] as num,
      monthlyRent: json['monthly_rent'] as num,
      description: json['description'] as String?,
      imageUrl: (json['image_url'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tenantsId: (json['tenants_id'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$HouseImplToJson(_$HouseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'owner_id': instance.ownerId,
      'address_line_one': instance.addressLineOne,
      'address_line_two': instance.addressLineTwo,
      'postcode': instance.postCode,
      'city': instance.city,
      'state': instance.state,
      'num_rooms': instance.numRooms,
      'num_bathrooms': instance.bathrooms,
      'monthly_rent': instance.monthlyRent,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'tenants_id': instance.tenantsId,
    };
