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
  @JsonKey(name: 'address')
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_rooms')
  num get numRooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'num_bathrooms')
  num get bathrooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_rent')
  double get monthlyRent => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  List<String>? get imageUrl => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'num_rooms') num numRooms,
      @JsonKey(name: 'num_bathrooms') num bathrooms,
      @JsonKey(name: 'monthly_rent') double monthlyRent,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'image_url') List<String>? imageUrl});
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
    Object? address = null,
    Object? numRooms = null,
    Object? bathrooms = null,
    Object? monthlyRent = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'address') String address,
      @JsonKey(name: 'num_rooms') num numRooms,
      @JsonKey(name: 'num_bathrooms') num bathrooms,
      @JsonKey(name: 'monthly_rent') double monthlyRent,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'image_url') List<String>? imageUrl});
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
    Object? address = null,
    Object? numRooms = null,
    Object? bathrooms = null,
    Object? monthlyRent = null,
    Object? description = freezed,
    Object? imageUrl = freezed,
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
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
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
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value._imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'address') required this.address,
      @JsonKey(name: 'num_rooms') required this.numRooms,
      @JsonKey(name: 'num_bathrooms') required this.bathrooms,
      @JsonKey(name: 'monthly_rent') required this.monthlyRent,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'image_url') final List<String>? imageUrl})
      : _imageUrl = imageUrl;

  factory _$HouseImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'owner_id')
  final String ownerId;
  @override
  @JsonKey(name: 'address')
  final String address;
  @override
  @JsonKey(name: 'num_rooms')
  final num numRooms;
  @override
  @JsonKey(name: 'num_bathrooms')
  final num bathrooms;
  @override
  @JsonKey(name: 'monthly_rent')
  final double monthlyRent;
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

  @override
  String toString() {
    return 'House(id: $id, ownerId: $ownerId, address: $address, numRooms: $numRooms, bathrooms: $bathrooms, monthlyRent: $monthlyRent, description: $description, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ownerId, ownerId) || other.ownerId == ownerId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.numRooms, numRooms) ||
                other.numRooms == numRooms) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms) &&
            (identical(other.monthlyRent, monthlyRent) ||
                other.monthlyRent == monthlyRent) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._imageUrl, _imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      ownerId,
      address,
      numRooms,
      bathrooms,
      monthlyRent,
      description,
      const DeepCollectionEquality().hash(_imageUrl));

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
      @JsonKey(name: 'address') required final String address,
      @JsonKey(name: 'num_rooms') required final num numRooms,
      @JsonKey(name: 'num_bathrooms') required final num bathrooms,
      @JsonKey(name: 'monthly_rent') required final double monthlyRent,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'image_url') final List<String>? imageUrl}) = _$HouseImpl;

  factory _House.fromJson(Map<String, dynamic> json) = _$HouseImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'owner_id')
  String get ownerId;
  @override
  @JsonKey(name: 'address')
  String get address;
  @override
  @JsonKey(name: 'num_rooms')
  num get numRooms;
  @override
  @JsonKey(name: 'num_bathrooms')
  num get bathrooms;
  @override
  @JsonKey(name: 'monthly_rent')
  double get monthlyRent;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'image_url')
  List<String>? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$HouseImplCopyWith<_$HouseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
