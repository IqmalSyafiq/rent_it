// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'house.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

House _$HouseFromJson(Map<String, dynamic> json) {
  return _House.fromJson(json);
}

/// @nodoc
mixin _$House {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner_id')
  String get ownerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line_one')
  String get addressLineOne => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_line_two')
  String? get addressLineTwo => throw _privateConstructorUsedError;
  @JsonKey(name: 'postcode')
  num get postCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_rooms')
  num get numRooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_bathrooms')
  num get bathrooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_rent')
  num get monthlyRent => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  List<String>? get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenants_id')
  List<String>? get tenantsId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HouseCopyWith<House> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseCopyWith<$Res> {
  factory $HouseCopyWith(House value, $Res Function(House) then) =
      _$HouseCopyWithImpl<$Res, House>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'address_line_one') String addressLineOne,
      @JsonKey(name: 'address_line_two') String? addressLineTwo,
      @JsonKey(name: 'postcode') num postCode,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'num_rooms') num numRooms,
      @JsonKey(name: 'num_bathrooms') num bathrooms,
      @JsonKey(name: 'monthly_rent') num monthlyRent,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'image_url') List<String>? imageUrl,
      @JsonKey(name: 'tenants_id') List<String>? tenantsId});
}

/// @nodoc
class _$HouseCopyWithImpl<$Res, $Val extends House>
    implements $HouseCopyWith<$Res> {
  _$HouseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? addressLineOne = null,
    Object? addressLineTwo = freezed,
    Object? postCode = null,
    Object? city = null,
    Object? state = null,
    Object? numRooms = null,
    Object? bathrooms = null,
    Object? monthlyRent = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? tenantsId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      addressLineOne: null == addressLineOne
          ? _value.addressLineOne
          : addressLineOne // ignore: cast_nullable_to_non_nullable
              as String,
      addressLineTwo: freezed == addressLineTwo
          ? _value.addressLineTwo
          : addressLineTwo // ignore: cast_nullable_to_non_nullable
              as String?,
      postCode: null == postCode
          ? _value.postCode
          : postCode // ignore: cast_nullable_to_non_nullable
              as num,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      numRooms: null == numRooms
          ? _value.numRooms
          : numRooms // ignore: cast_nullable_to_non_nullable
              as num,
      bathrooms: null == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as num,
      monthlyRent: null == monthlyRent
          ? _value.monthlyRent
          : monthlyRent // ignore: cast_nullable_to_non_nullable
              as num,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tenantsId: freezed == tenantsId
          ? _value.tenantsId
          : tenantsId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseImplCopyWith<$Res> implements $HouseCopyWith<$Res> {
  factory _$$HouseImplCopyWith(
          _$HouseImpl value, $Res Function(_$HouseImpl) then) =
      __$$HouseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'owner_id') String ownerId,
      @JsonKey(name: 'address_line_one') String addressLineOne,
      @JsonKey(name: 'address_line_two') String? addressLineTwo,
      @JsonKey(name: 'postcode') num postCode,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'num_rooms') num numRooms,
      @JsonKey(name: 'num_bathrooms') num bathrooms,
      @JsonKey(name: 'monthly_rent') num monthlyRent,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'image_url') List<String>? imageUrl,
      @JsonKey(name: 'tenants_id') List<String>? tenantsId});
}

/// @nodoc
class __$$HouseImplCopyWithImpl<$Res>
    extends _$HouseCopyWithImpl<$Res, _$HouseImpl>
    implements _$$HouseImplCopyWith<$Res> {
  __$$HouseImplCopyWithImpl(
      _$HouseImpl _value, $Res Function(_$HouseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ownerId = null,
    Object? addressLineOne = null,
    Object? addressLineTwo = freezed,
    Object? postCode = null,
    Object? city = null,
    Object? state = null,
    Object? numRooms = null,
    Object? bathrooms = null,
    Object? monthlyRent = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
    Object? tenantsId = freezed,
  }) {
    return _then(_$HouseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ownerId: null == ownerId
          ? _value.ownerId
          : ownerId // ignore: cast_nullable_to_non_nullable
              as String,
      addressLineOne: null == addressLineOne
          ? _value.addressLineOne
          : addressLineOne // ignore: cast_nullable_to_non_nullable
              as String,
      addressLineTwo: freezed == addressLineTwo
          ? _value.addressLineTwo
          : addressLineTwo // ignore: cast_nullable_to_non_nullable
              as String?,
      postCode: null == postCode
          ? _value.postCode
          : postCode // ignore: cast_nullable_to_non_nullable
              as num,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      numRooms: null == numRooms
          ? _value.numRooms
          : numRooms // ignore: cast_nullable_to_non_nullable
              as num,
      bathrooms: null == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as num,
      monthlyRent: null == monthlyRent
          ? _value.monthlyRent
          : monthlyRent // ignore: cast_nullable_to_non_nullable
              as num,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value._imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tenantsId: freezed == tenantsId
          ? _value._tenantsId
          : tenantsId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseImpl implements _House {
  _$HouseImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'owner_id') required this.ownerId,
      @JsonKey(name: 'address_line_one') required this.addressLineOne,
      @JsonKey(name: 'address_line_two') this.addressLineTwo,
      @JsonKey(name: 'postcode') required this.postCode,
      @JsonKey(name: 'city') required this.city,
      @JsonKey(name: 'state') required this.state,
      @JsonKey(name: 'num_rooms') required this.numRooms,
      @JsonKey(name: 'num_bathrooms') required this.bathrooms,
      @JsonKey(name: 'monthly_rent') required this.monthlyRent,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'image_url') final List<String>? imageUrl,
      @JsonKey(name: 'tenants_id') final List<String>? tenantsId})
      : _imageUrl = imageUrl,
        _tenantsId = tenantsId;

  factory _$HouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  @JsonKey(name: 'address_line_one')
  final String addressLineOne;
  @override
  @JsonKey(name: 'address_line_two')
  final String? addressLineTwo;
  @override
  @JsonKey(name: 'postcode')
  final num postCode;
  @override
  @JsonKey(name: 'city')
  final String city;
  @override
  @JsonKey(name: 'state')
  final String state;
  @override
  @JsonKey(name: 'num_rooms')
  final num numRooms;
  @override
  @JsonKey(name: 'num_bathrooms')
  final num bathrooms;
  @override
  @JsonKey(name: 'monthly_rent')
  final num monthlyRent;
  @override
  @JsonKey(name: 'description')
  final String? description;
  final List<String>? _imageUrl;
  @override
  @JsonKey(name: 'image_url')
  List<String>? get imageUrl {
    final value = _imageUrl;
    if (value == null) return null;
    if (_imageUrl is EqualUnmodifiableListView) return _imageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _tenantsId;
  @override
  @JsonKey(name: 'tenants_id')
  List<String>? get tenantsId {
    final value = _tenantsId;
    if (value == null) return null;
    if (_tenantsId is EqualUnmodifiableListView) return _tenantsId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'House(id: $id, ownerId: $ownerId, addressLineOne: $addressLineOne, addressLineTwo: $addressLineTwo, postCode: $postCode, city: $city, state: $state, numRooms: $numRooms, bathrooms: $bathrooms, monthlyRent: $monthlyRent, description: $description, imageUrl: $imageUrl, tenantsId: $tenantsId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.addressLineOne, addressLineOne) ||
                other.addressLineOne == addressLineOne) &&
            (identical(other.addressLineTwo, addressLineTwo) ||
                other.addressLineTwo == addressLineTwo) &&
            (identical(other.postCode, postCode) ||
                other.postCode == postCode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.numRooms, numRooms) ||
                other.numRooms == numRooms) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms) &&
            (identical(other.monthlyRent, monthlyRent) ||
                other.monthlyRent == monthlyRent) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._imageUrl, _imageUrl) &&
            const DeepCollectionEquality()
                .equals(other._tenantsId, _tenantsId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      addressLineOne,
      addressLineTwo,
      postCode,
      city,
      state,
      numRooms,
      bathrooms,
      monthlyRent,
      description,
      const DeepCollectionEquality().hash(_imageUrl),
      const DeepCollectionEquality().hash(_tenantsId));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseImplCopyWith<_$HouseImpl> get copyWith =>
      __$$HouseImplCopyWithImpl<_$HouseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseImplToJson(
      this,
    );
  }
}

abstract class _House implements House {
  factory _House(
      {@JsonKey(name: 'id') required final String id,
      @JsonKey(name: 'owner_id') required final String ownerId,
      @JsonKey(name: 'address_line_one') required final String addressLineOne,
      @JsonKey(name: 'address_line_two') final String? addressLineTwo,
      @JsonKey(name: 'postcode') required final num postCode,
      @JsonKey(name: 'city') required final String city,
      @JsonKey(name: 'state') required final String state,
      @JsonKey(name: 'num_rooms') required final num numRooms,
      @JsonKey(name: 'num_bathrooms') required final num bathrooms,
      @JsonKey(name: 'monthly_rent') required final num monthlyRent,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'image_url') final List<String>? imageUrl,
      @JsonKey(name: 'tenants_id')
      final List<String>? tenantsId}) = _$HouseImpl;

  factory _House.fromJson(Map<String, dynamic> json) = _$HouseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  @JsonKey(name: 'address_line_one')
  String get addressLineOne;
  @override
  @JsonKey(name: 'address_line_two')
  String? get addressLineTwo;
  @override
  @JsonKey(name: 'postcode')
  num get postCode;
  @override
  @JsonKey(name: 'city')
  String get city;
  @override
  @JsonKey(name: 'state')
  String get state;
  @override
  @JsonKey(name: 'num_rooms')
  num get numRooms;
  @override
  @JsonKey(name: 'num_bathrooms')
  num get bathrooms;
  @override
  @JsonKey(name: 'monthly_rent')
  num get monthlyRent;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'image_url')
  List<String>? get imageUrl;
  @override
  @JsonKey(name: 'tenants_id')
  List<String>? get tenantsId;
  @override
  @JsonKey(ignore: true)
  _$$HouseImplCopyWith<_$HouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
