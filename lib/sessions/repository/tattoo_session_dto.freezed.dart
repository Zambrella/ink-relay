// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tattoo_session_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TattooSessionDto _$TattooSessionDtoFromJson(Map<String, dynamic> json) {
  return _TattooSessionDto.fromJson(json);
}

/// @nodoc
mixin _$TattooSessionDto {
  @JsonKey(includeToJson: false)
  String get $id => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  DateTime get $createdAt => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  DateTime get $updatedAt => throw _privateConstructorUsedError;
  DateTime get when => throw _privateConstructorUsedError;
  int get duration => throw _privateConstructorUsedError;
  String get status =>
      throw _privateConstructorUsedError; // Not interested in the entire artist object, just the id.
  @JsonKey(readValue: TattooSessionDto._artistIdFromJson)
  String get artist =>
      throw _privateConstructorUsedError; // Only need to save the id to the database because it's a relation.
  @JsonKey(toJson: TattooSessionDto._contactToJson)
  ContactDto get contact => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this TattooSessionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TattooSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TattooSessionDtoCopyWith<TattooSessionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TattooSessionDtoCopyWith<$Res> {
  factory $TattooSessionDtoCopyWith(
          TattooSessionDto value, $Res Function(TattooSessionDto) then) =
      _$TattooSessionDtoCopyWithImpl<$Res, TattooSessionDto>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String $id,
      @JsonKey(includeToJson: false) DateTime $createdAt,
      @JsonKey(includeToJson: false) DateTime $updatedAt,
      DateTime when,
      int duration,
      String status,
      @JsonKey(readValue: TattooSessionDto._artistIdFromJson) String artist,
      @JsonKey(toJson: TattooSessionDto._contactToJson) ContactDto contact,
      String? notes});

  $ContactDtoCopyWith<$Res> get contact;
}

/// @nodoc
class _$TattooSessionDtoCopyWithImpl<$Res, $Val extends TattooSessionDto>
    implements $TattooSessionDtoCopyWith<$Res> {
  _$TattooSessionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TattooSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? $id = null,
    Object? $createdAt = null,
    Object? $updatedAt = null,
    Object? when = null,
    Object? duration = null,
    Object? status = null,
    Object? artist = null,
    Object? contact = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      $id: null == $id
          ? _value.$id
          : $id // ignore: cast_nullable_to_non_nullable
              as String,
      $createdAt: null == $createdAt
          ? _value.$createdAt
          : $createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      $updatedAt: null == $updatedAt
          ? _value.$updatedAt
          : $updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as ContactDto,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of TattooSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContactDtoCopyWith<$Res> get contact {
    return $ContactDtoCopyWith<$Res>(_value.contact, (value) {
      return _then(_value.copyWith(contact: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TattooSessionDtoImplCopyWith<$Res>
    implements $TattooSessionDtoCopyWith<$Res> {
  factory _$$TattooSessionDtoImplCopyWith(_$TattooSessionDtoImpl value,
          $Res Function(_$TattooSessionDtoImpl) then) =
      __$$TattooSessionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String $id,
      @JsonKey(includeToJson: false) DateTime $createdAt,
      @JsonKey(includeToJson: false) DateTime $updatedAt,
      DateTime when,
      int duration,
      String status,
      @JsonKey(readValue: TattooSessionDto._artistIdFromJson) String artist,
      @JsonKey(toJson: TattooSessionDto._contactToJson) ContactDto contact,
      String? notes});

  @override
  $ContactDtoCopyWith<$Res> get contact;
}

/// @nodoc
class __$$TattooSessionDtoImplCopyWithImpl<$Res>
    extends _$TattooSessionDtoCopyWithImpl<$Res, _$TattooSessionDtoImpl>
    implements _$$TattooSessionDtoImplCopyWith<$Res> {
  __$$TattooSessionDtoImplCopyWithImpl(_$TattooSessionDtoImpl _value,
      $Res Function(_$TattooSessionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of TattooSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? $id = null,
    Object? $createdAt = null,
    Object? $updatedAt = null,
    Object? when = null,
    Object? duration = null,
    Object? status = null,
    Object? artist = null,
    Object? contact = null,
    Object? notes = freezed,
  }) {
    return _then(_$TattooSessionDtoImpl(
      $id: null == $id
          ? _value.$id
          : $id // ignore: cast_nullable_to_non_nullable
              as String,
      $createdAt: null == $createdAt
          ? _value.$createdAt
          : $createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      $updatedAt: null == $updatedAt
          ? _value.$updatedAt
          : $updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      when: null == when
          ? _value.when
          : when // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as ContactDto,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TattooSessionDtoImpl extends _TattooSessionDto {
  const _$TattooSessionDtoImpl(
      {@JsonKey(includeToJson: false) required this.$id,
      @JsonKey(includeToJson: false) required this.$createdAt,
      @JsonKey(includeToJson: false) required this.$updatedAt,
      required this.when,
      required this.duration,
      required this.status,
      @JsonKey(readValue: TattooSessionDto._artistIdFromJson)
      required this.artist,
      @JsonKey(toJson: TattooSessionDto._contactToJson) required this.contact,
      this.notes})
      : super._();

  factory _$TattooSessionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$TattooSessionDtoImplFromJson(json);

  @override
  @JsonKey(includeToJson: false)
  final String $id;
  @override
  @JsonKey(includeToJson: false)
  final DateTime $createdAt;
  @override
  @JsonKey(includeToJson: false)
  final DateTime $updatedAt;
  @override
  final DateTime when;
  @override
  final int duration;
  @override
  final String status;
// Not interested in the entire artist object, just the id.
  @override
  @JsonKey(readValue: TattooSessionDto._artistIdFromJson)
  final String artist;
// Only need to save the id to the database because it's a relation.
  @override
  @JsonKey(toJson: TattooSessionDto._contactToJson)
  final ContactDto contact;
  @override
  final String? notes;

  @override
  String toString() {
    return 'TattooSessionDto(\$id: ${$id}, \$createdAt: ${$createdAt}, \$updatedAt: ${$updatedAt}, when: $when, duration: $duration, status: $status, artist: $artist, contact: $contact, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TattooSessionDtoImpl &&
            (identical(other.$id, $id) || other.$id == $id) &&
            (identical(other.$createdAt, $createdAt) ||
                other.$createdAt == $createdAt) &&
            (identical(other.$updatedAt, $updatedAt) ||
                other.$updatedAt == $updatedAt) &&
            (identical(other.when, when) || other.when == when) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.artist, artist) || other.artist == artist) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, $id, $createdAt, $updatedAt,
      when, duration, status, artist, contact, notes);

  /// Create a copy of TattooSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TattooSessionDtoImplCopyWith<_$TattooSessionDtoImpl> get copyWith =>
      __$$TattooSessionDtoImplCopyWithImpl<_$TattooSessionDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TattooSessionDtoImplToJson(
      this,
    );
  }
}

abstract class _TattooSessionDto extends TattooSessionDto {
  const factory _TattooSessionDto(
      {@JsonKey(includeToJson: false) required final String $id,
      @JsonKey(includeToJson: false) required final DateTime $createdAt,
      @JsonKey(includeToJson: false) required final DateTime $updatedAt,
      required final DateTime when,
      required final int duration,
      required final String status,
      @JsonKey(readValue: TattooSessionDto._artistIdFromJson)
      required final String artist,
      @JsonKey(toJson: TattooSessionDto._contactToJson)
      required final ContactDto contact,
      final String? notes}) = _$TattooSessionDtoImpl;
  const _TattooSessionDto._() : super._();

  factory _TattooSessionDto.fromJson(Map<String, dynamic> json) =
      _$TattooSessionDtoImpl.fromJson;

  @override
  @JsonKey(includeToJson: false)
  String get $id;
  @override
  @JsonKey(includeToJson: false)
  DateTime get $createdAt;
  @override
  @JsonKey(includeToJson: false)
  DateTime get $updatedAt;
  @override
  DateTime get when;
  @override
  int get duration;
  @override
  String get status; // Not interested in the entire artist object, just the id.
  @override
  @JsonKey(readValue: TattooSessionDto._artistIdFromJson)
  String
      get artist; // Only need to save the id to the database because it's a relation.
  @override
  @JsonKey(toJson: TattooSessionDto._contactToJson)
  ContactDto get contact;
  @override
  String? get notes;

  /// Create a copy of TattooSessionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TattooSessionDtoImplCopyWith<_$TattooSessionDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
