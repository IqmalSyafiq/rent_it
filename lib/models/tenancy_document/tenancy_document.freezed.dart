// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tenancy_document.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TenancyDocument _$TenancyDocumentFromJson(Map<String, dynamic> json) {
  return _TenancyDocument.fromJson(json);
}

/// @nodoc
mixin _$TenancyDocument {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'tenancy_id')
  String get tenancyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'document_name')
  String get documentName => throw _privateConstructorUsedError;
  @JsonKey(name: 'upload_date')
  int get uploadDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'document_url')
  String get documentUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TenancyDocumentCopyWith<TenancyDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TenancyDocumentCopyWith<$Res> {
  factory $TenancyDocumentCopyWith(
          TenancyDocument value, $Res Function(TenancyDocument) then) =
      _$TenancyDocumentCopyWithImpl<$Res, TenancyDocument>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'tenancy_id') String tenancyId,
      @JsonKey(name: 'document_name') String documentName,
      @JsonKey(name: 'upload_date') int uploadDate,
      @JsonKey(name: 'document_url') String documentUrl});
}

/// @nodoc
class _$TenancyDocumentCopyWithImpl<$Res, $Val extends TenancyDocument>
    implements $TenancyDocumentCopyWith<$Res> {
  _$TenancyDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenancyId = null,
    Object? documentName = null,
    Object? uploadDate = null,
    Object? documentUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tenancyId: null == tenancyId
          ? _value.tenancyId
          : tenancyId // ignore: cast_nullable_to_non_nullable
              as String,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as int,
      documentUrl: null == documentUrl
          ? _value.documentUrl
          : documentUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TenancyDocumentImplCopyWith<$Res>
    implements $TenancyDocumentCopyWith<$Res> {
  factory _$$TenancyDocumentImplCopyWith(_$TenancyDocumentImpl value,
          $Res Function(_$TenancyDocumentImpl) then) =
      __$$TenancyDocumentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'tenancy_id') String tenancyId,
      @JsonKey(name: 'document_name') String documentName,
      @JsonKey(name: 'upload_date') int uploadDate,
      @JsonKey(name: 'document_url') String documentUrl});
}

/// @nodoc
class __$$TenancyDocumentImplCopyWithImpl<$Res>
    extends _$TenancyDocumentCopyWithImpl<$Res, _$TenancyDocumentImpl>
    implements _$$TenancyDocumentImplCopyWith<$Res> {
  __$$TenancyDocumentImplCopyWithImpl(
      _$TenancyDocumentImpl _value, $Res Function(_$TenancyDocumentImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? tenancyId = null,
    Object? documentName = null,
    Object? uploadDate = null,
    Object? documentUrl = null,
  }) {
    return _then(_$TenancyDocumentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      tenancyId: null == tenancyId
          ? _value.tenancyId
          : tenancyId // ignore: cast_nullable_to_non_nullable
              as String,
      documentName: null == documentName
          ? _value.documentName
          : documentName // ignore: cast_nullable_to_non_nullable
              as String,
      uploadDate: null == uploadDate
          ? _value.uploadDate
          : uploadDate // ignore: cast_nullable_to_non_nullable
              as int,
      documentUrl: null == documentUrl
          ? _value.documentUrl
          : documentUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TenancyDocumentImpl implements _TenancyDocument {
  _$TenancyDocumentImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'tenancy_id') required this.tenancyId,
      @JsonKey(name: 'document_name') required this.documentName,
      @JsonKey(name: 'upload_date') required this.uploadDate,
      @JsonKey(name: 'document_url') required this.documentUrl});

  factory _$TenancyDocumentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TenancyDocumentImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'tenancy_id')
  final String tenancyId;
  @override
  @JsonKey(name: 'document_name')
  final String documentName;
  @override
  @JsonKey(name: 'upload_date')
  final int uploadDate;
  @override
  @JsonKey(name: 'document_url')
  final String documentUrl;

  @override
  String toString() {
    return 'TenancyDocument(id: $id, tenancyId: $tenancyId, documentName: $documentName, uploadDate: $uploadDate, documentUrl: $documentUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TenancyDocumentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.tenancyId, tenancyId) ||
                other.tenancyId == tenancyId) &&
            (identical(other.documentName, documentName) ||
                other.documentName == documentName) &&
            (identical(other.uploadDate, uploadDate) ||
                other.uploadDate == uploadDate) &&
            (identical(other.documentUrl, documentUrl) ||
                other.documentUrl == documentUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, tenancyId, documentName, uploadDate, documentUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TenancyDocumentImplCopyWith<_$TenancyDocumentImpl> get copyWith =>
      __$$TenancyDocumentImplCopyWithImpl<_$TenancyDocumentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TenancyDocumentImplToJson(
      this,
    );
  }
}

abstract class _TenancyDocument implements TenancyDocument {
  factory _TenancyDocument(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'tenancy_id') required final String tenancyId,
          @JsonKey(name: 'document_name') required final String documentName,
          @JsonKey(name: 'upload_date') required final int uploadDate,
          @JsonKey(name: 'document_url') required final String documentUrl}) =
      _$TenancyDocumentImpl;

  factory _TenancyDocument.fromJson(Map<String, dynamic> json) =
      _$TenancyDocumentImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'tenancy_id')
  String get tenancyId;
  @override
  @JsonKey(name: 'document_name')
  String get documentName;
  @override
  @JsonKey(name: 'upload_date')
  int get uploadDate;
  @override
  @JsonKey(name: 'document_url')
  String get documentUrl;
  @override
  @JsonKey(ignore: true)
  _$$TenancyDocumentImplCopyWith<_$TenancyDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
