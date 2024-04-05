// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenancy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Tenancy _$TenancyFromJson(Map<String, dynamic> json) {
  return _Tenancy.fromJson(json);
}

/// @nodoc
mixin _$Tenancy {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenant_id')
  String get tenantId => throw _privateConstructorUsedError;
  @JsonKey(name: 'house_id')
  String get houseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  int get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  int get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'rent_amount')
  num get rentAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenancyCopyWith<Tenancy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenancyCopyWith<$Res> {
  factory $TenancyCopyWith(Tenancy value, $Res Function(Tenancy) then) =
      _$TenancyCopyWithImpl<$Res, Tenancy>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'tenant_id') String tenantId,
      @JsonKey(name: 'house_id') String houseId,
      @JsonKey(name: 'start_date') int startDate,
      @JsonKey(name: 'end_date') int endDate,
      @JsonKey(name: 'rent_amount') num rentAmount});
}

/// @nodoc
class _$TenancyCopyWithImpl<$Res, $Val extends Tenancy>
    implements $TenancyCopyWith<$Res> {
  _$TenancyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? houseId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? rentAmount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      houseId: null == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
      rentAmount: null == rentAmount
          ? _value.rentAmount
          : rentAmount // ignore: cast_nullable_to_non_nullable
              as num,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TenancyImplCopyWith<$Res> implements $TenancyCopyWith<$Res> {
  factory _$$TenancyImplCopyWith(
          _$TenancyImpl value, $Res Function(_$TenancyImpl) then) =
      __$$TenancyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'tenant_id') String tenantId,
      @JsonKey(name: 'house_id') String houseId,
      @JsonKey(name: 'start_date') int startDate,
      @JsonKey(name: 'end_date') int endDate,
      @JsonKey(name: 'rent_amount') num rentAmount});
}

/// @nodoc
class __$$TenancyImplCopyWithImpl<$Res>
    extends _$TenancyCopyWithImpl<$Res, _$TenancyImpl>
    implements _$$TenancyImplCopyWith<$Res> {
  __$$TenancyImplCopyWithImpl(
      _$TenancyImpl _value, $Res Function(_$TenancyImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenantId = null,
    Object? houseId = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? rentAmount = null,
  }) {
    return _then(_$TenancyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tenantId: null == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as String,
      houseId: null == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as int,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as int,
      rentAmount: null == rentAmount
          ? _value.rentAmount
          : rentAmount // ignore: cast_nullable_to_non_nullable
              as num,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TenancyImpl implements _Tenancy {
  _$TenancyImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'tenant_id') required this.tenantId,
      @JsonKey(name: 'house_id') required this.houseId,
      @JsonKey(name: 'start_date') required this.startDate,
      @JsonKey(name: 'end_date') required this.endDate,
      @JsonKey(name: 'rent_amount') required this.rentAmount});

  factory _$TenancyImpl.fromJson(Map<String, dynamic> json) =>
      _$$TenancyImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'tenant_id')
  final String tenantId;
  @override
  @JsonKey(name: 'house_id')
  final String houseId;
  @override
  @JsonKey(name: 'start_date')
  final int startDate;
  @override
  @JsonKey(name: 'end_date')
  final int endDate;
  @override
  @JsonKey(name: 'rent_amount')
  final num rentAmount;

  @override
  String toString() {
    return 'Tenancy(id: $id, tenantId: $tenantId, houseId: $houseId, startDate: $startDate, endDate: $endDate, rentAmount: $rentAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TenancyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.rentAmount, rentAmount) ||
                other.rentAmount == rentAmount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, tenantId, houseId, startDate, endDate, rentAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TenancyImplCopyWith<_$TenancyImpl> get copyWith =>
      __$$TenancyImplCopyWithImpl<_$TenancyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TenancyImplToJson(
      this,
    );
  }
}

abstract class _Tenancy implements Tenancy {
  factory _Tenancy(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'tenant_id') required final String tenantId,
          @JsonKey(name: 'house_id') required final String houseId,
          @JsonKey(name: 'start_date') required final int startDate,
          @JsonKey(name: 'end_date') required final int endDate,
          @JsonKey(name: 'rent_amount') required final num rentAmount}) =
      _$TenancyImpl;

  factory _Tenancy.fromJson(Map<String, dynamic> json) = _$TenancyImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'tenant_id')
  String get tenantId;
  @override
  @JsonKey(name: 'house_id')
  String get houseId;
  @override
  @JsonKey(name: 'start_date')
  int get startDate;
  @override
  @JsonKey(name: 'end_date')
  int get endDate;
  @override
  @JsonKey(name: 'rent_amount')
  num get rentAmount;
  @override
  @JsonKey(ignore: true)
  _$$TenancyImplCopyWith<_$TenancyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
