// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'report_id')
  String get reportId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  NotificationType get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'body')
  String? get body => throw _privateConstructorUsedError;
  @JsonKey(name: 'house_id')
  String? get houseId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payload')
  Map<String, dynamic>? get payload => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_read')
  bool? get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  int get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenancy_id')
  String? get tenancyId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'report_id') String reportId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'type') NotificationType type,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'house_id') String? houseId,
      @JsonKey(name: 'payload') Map<String, dynamic>? payload,
      @JsonKey(name: 'is_read') bool? isRead,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'tenancy_id') String? tenancyId});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? reportId = null,
    Object? title = null,
    Object? type = null,
    Object? body = freezed,
    Object? houseId = freezed,
    Object? payload = freezed,
    Object? isRead = freezed,
    Object? createdAt = null,
    Object? tenancyId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      houseId: freezed == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      tenancyId: freezed == tenancyId
          ? _value.tenancyId
          : tenancyId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'report_id') String reportId,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'type') NotificationType type,
      @JsonKey(name: 'body') String? body,
      @JsonKey(name: 'house_id') String? houseId,
      @JsonKey(name: 'payload') Map<String, dynamic>? payload,
      @JsonKey(name: 'is_read') bool? isRead,
      @JsonKey(name: 'created_at') int createdAt,
      @JsonKey(name: 'tenancy_id') String? tenancyId});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? reportId = null,
    Object? title = null,
    Object? type = null,
    Object? body = freezed,
    Object? houseId = freezed,
    Object? payload = freezed,
    Object? isRead = freezed,
    Object? createdAt = null,
    Object? tenancyId = freezed,
  }) {
    return _then(_$NotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      reportId: null == reportId
          ? _value.reportId
          : reportId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      houseId: freezed == houseId
          ? _value.houseId
          : houseId // ignore: cast_nullable_to_non_nullable
              as String?,
      payload: freezed == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      tenancyId: freezed == tenancyId
          ? _value.tenancyId
          : tenancyId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  _$NotificationImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'report_id') required this.reportId,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'body') this.body,
      @JsonKey(name: 'house_id') this.houseId,
      @JsonKey(name: 'payload') final Map<String, dynamic>? payload = null,
      @JsonKey(name: 'is_read') this.isRead = false,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'tenancy_id') this.tenancyId})
      : _payload = payload;

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'report_id')
  final String reportId;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'type')
  final NotificationType type;
  @override
  @JsonKey(name: 'body')
  final String? body;
  @override
  @JsonKey(name: 'house_id')
  final String? houseId;
  final Map<String, dynamic>? _payload;
  @override
  @JsonKey(name: 'payload')
  Map<String, dynamic>? get payload {
    final value = _payload;
    if (value == null) return null;
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'is_read')
  final bool? isRead;
  @override
  @JsonKey(name: 'created_at')
  final int createdAt;
  @override
  @JsonKey(name: 'tenancy_id')
  final String? tenancyId;

  @override
  String toString() {
    return 'Notification(id: $id, userId: $userId, reportId: $reportId, title: $title, type: $type, body: $body, houseId: $houseId, payload: $payload, isRead: $isRead, createdAt: $createdAt, tenancyId: $tenancyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.reportId, reportId) ||
                other.reportId == reportId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.houseId, houseId) || other.houseId == houseId) &&
            const DeepCollectionEquality().equals(other._payload, _payload) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.tenancyId, tenancyId) ||
                other.tenancyId == tenancyId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      reportId,
      title,
      type,
      body,
      houseId,
      const DeepCollectionEquality().hash(_payload),
      isRead,
      createdAt,
      tenancyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  factory _Notification(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'report_id') required final String reportId,
          @JsonKey(name: 'title') required final String title,
          @JsonKey(name: 'type') required final NotificationType type,
          @JsonKey(name: 'body') final String? body,
          @JsonKey(name: 'house_id') final String? houseId,
          @JsonKey(name: 'payload') final Map<String, dynamic>? payload,
          @JsonKey(name: 'is_read') final bool? isRead,
          @JsonKey(name: 'created_at') required final int createdAt,
          @JsonKey(name: 'tenancy_id') final String? tenancyId}) =
      _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'report_id')
  String get reportId;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'type')
  NotificationType get type;
  @override
  @JsonKey(name: 'body')
  String? get body;
  @override
  @JsonKey(name: 'house_id')
  String? get houseId;
  @override
  @JsonKey(name: 'payload')
  Map<String, dynamic>? get payload;
  @override
  @JsonKey(name: 'is_read')
  bool? get isRead;
  @override
  @JsonKey(name: 'created_at')
  int get createdAt;
  @override
  @JsonKey(name: 'tenancy_id')
  String? get tenancyId;
  @override
  @JsonKey(ignore: true)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
