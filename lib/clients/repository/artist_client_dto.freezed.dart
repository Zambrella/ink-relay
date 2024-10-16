// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'artist_client_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ArtistClientDto _$ArtistClientDtoFromJson(Map<String, dynamic> json) {
  return _ArtistClientDto.fromJson(json);
}

/// @nodoc
mixin _$ArtistClientDto {
// ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  String get $id =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  DateTime get $createdAt =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeToJson: false)
  DateTime get $updatedAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get inquiredAt =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(readValue: ArtistClientDto.artistIdFromJson)
  String get artist => throw _privateConstructorUsedError;

  /// Serializes this ArtistClientDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ArtistClientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArtistClientDtoCopyWith<ArtistClientDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArtistClientDtoCopyWith<$Res> {
  factory $ArtistClientDtoCopyWith(
          ArtistClientDto value, $Res Function(ArtistClientDto) then) =
      _$ArtistClientDtoCopyWithImpl<$Res, ArtistClientDto>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String $id,
      @JsonKey(includeToJson: false) DateTime $createdAt,
      @JsonKey(includeToJson: false) DateTime $updatedAt,
      String name,
      DateTime inquiredAt,
      @JsonKey(readValue: ArtistClientDto.artistIdFromJson) String artist});
}

/// @nodoc
class _$ArtistClientDtoCopyWithImpl<$Res, $Val extends ArtistClientDto>
    implements $ArtistClientDtoCopyWith<$Res> {
  _$ArtistClientDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ArtistClientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? $id = null,
    Object? $createdAt = null,
    Object? $updatedAt = null,
    Object? name = null,
    Object? inquiredAt = null,
    Object? artist = null,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inquiredAt: null == inquiredAt
          ? _value.inquiredAt
          : inquiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArtistClientDtoImplCopyWith<$Res>
    implements $ArtistClientDtoCopyWith<$Res> {
  factory _$$ArtistClientDtoImplCopyWith(_$ArtistClientDtoImpl value,
          $Res Function(_$ArtistClientDtoImpl) then) =
      __$$ArtistClientDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String $id,
      @JsonKey(includeToJson: false) DateTime $createdAt,
      @JsonKey(includeToJson: false) DateTime $updatedAt,
      String name,
      DateTime inquiredAt,
      @JsonKey(readValue: ArtistClientDto.artistIdFromJson) String artist});
}

/// @nodoc
class __$$ArtistClientDtoImplCopyWithImpl<$Res>
    extends _$ArtistClientDtoCopyWithImpl<$Res, _$ArtistClientDtoImpl>
    implements _$$ArtistClientDtoImplCopyWith<$Res> {
  __$$ArtistClientDtoImplCopyWithImpl(
      _$ArtistClientDtoImpl _value, $Res Function(_$ArtistClientDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ArtistClientDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? $id = null,
    Object? $createdAt = null,
    Object? $updatedAt = null,
    Object? name = null,
    Object? inquiredAt = null,
    Object? artist = null,
  }) {
    return _then(_$ArtistClientDtoImpl(
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      inquiredAt: null == inquiredAt
          ? _value.inquiredAt
          : inquiredAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      artist: null == artist
          ? _value.artist
          : artist // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArtistClientDtoImpl extends _ArtistClientDto {
  const _$ArtistClientDtoImpl(
      {@JsonKey(includeToJson: false) required this.$id,
      @JsonKey(includeToJson: false) required this.$createdAt,
      @JsonKey(includeToJson: false) required this.$updatedAt,
      required this.name,
      required this.inquiredAt,
      @JsonKey(readValue: ArtistClientDto.artistIdFromJson)
      required this.artist})
      : super._();

  factory _$ArtistClientDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArtistClientDtoImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  final String $id;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  final DateTime $createdAt;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  final DateTime $updatedAt;
  @override
  final String name;
  @override
  final DateTime inquiredAt;
// ignore: invalid_annotation_target
  @override
  @JsonKey(readValue: ArtistClientDto.artistIdFromJson)
  final String artist;

  @override
  String toString() {
    return 'ArtistClientDto(\$id: ${$id}, \$createdAt: ${$createdAt}, \$updatedAt: ${$updatedAt}, name: $name, inquiredAt: $inquiredAt, artist: $artist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArtistClientDtoImpl &&
            (identical(other.$id, $id) || other.$id == $id) &&
            (identical(other.$createdAt, $createdAt) ||
                other.$createdAt == $createdAt) &&
            (identical(other.$updatedAt, $updatedAt) ||
                other.$updatedAt == $updatedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.inquiredAt, inquiredAt) ||
                other.inquiredAt == inquiredAt) &&
            (identical(other.artist, artist) || other.artist == artist));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, $id, $createdAt, $updatedAt, name, inquiredAt, artist);

  /// Create a copy of ArtistClientDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArtistClientDtoImplCopyWith<_$ArtistClientDtoImpl> get copyWith =>
      __$$ArtistClientDtoImplCopyWithImpl<_$ArtistClientDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArtistClientDtoImplToJson(
      this,
    );
  }
}

abstract class _ArtistClientDto extends ArtistClientDto {
  const factory _ArtistClientDto(
      {@JsonKey(includeToJson: false) required final String $id,
      @JsonKey(includeToJson: false) required final DateTime $createdAt,
      @JsonKey(includeToJson: false) required final DateTime $updatedAt,
      required final String name,
      required final DateTime inquiredAt,
      @JsonKey(readValue: ArtistClientDto.artistIdFromJson)
      required final String artist}) = _$ArtistClientDtoImpl;
  const _ArtistClientDto._() : super._();

  factory _ArtistClientDto.fromJson(Map<String, dynamic> json) =
      _$ArtistClientDtoImpl.fromJson;

// ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  String get $id; // ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  DateTime get $createdAt; // ignore: invalid_annotation_target
  @override
  @JsonKey(includeToJson: false)
  DateTime get $updatedAt;
  @override
  String get name;
  @override
  DateTime get inquiredAt; // ignore: invalid_annotation_target
  @override
  @JsonKey(readValue: ArtistClientDto.artistIdFromJson)
  String get artist;

  /// Create a copy of ArtistClientDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArtistClientDtoImplCopyWith<_$ArtistClientDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
