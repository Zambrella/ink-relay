// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_client.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ArtistClientCWProxy {
  ArtistClient id(Identifier id);

  ArtistClient createdAt(DateTime createdAt);

  ArtistClient updatedAt(DateTime updatedAt);

  ArtistClient name(String name);

  ArtistClient inquiredAt(DateTime inquiredAt);

  ArtistClient artistId(Identifier artistId);

  ArtistClient clientId(Identifier? clientId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ArtistClient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ArtistClient(...).copyWith(id: 12, name: "My name")
  /// ````
  ArtistClient call({
    Identifier? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    DateTime? inquiredAt,
    Identifier? artistId,
    Identifier? clientId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfArtistClient.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfArtistClient.copyWith.fieldName(...)`
class _$ArtistClientCWProxyImpl implements _$ArtistClientCWProxy {
  const _$ArtistClientCWProxyImpl(this._value);

  final ArtistClient _value;

  @override
  ArtistClient id(Identifier id) => this(id: id);

  @override
  ArtistClient createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  ArtistClient updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  ArtistClient name(String name) => this(name: name);

  @override
  ArtistClient inquiredAt(DateTime inquiredAt) => this(inquiredAt: inquiredAt);

  @override
  ArtistClient artistId(Identifier artistId) => this(artistId: artistId);

  @override
  ArtistClient clientId(Identifier? clientId) => this(clientId: clientId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ArtistClient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ArtistClient(...).copyWith(id: 12, name: "My name")
  /// ````
  ArtistClient call({
    Object? id = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? inquiredAt = const $CopyWithPlaceholder(),
    Object? artistId = const $CopyWithPlaceholder(),
    Object? clientId = const $CopyWithPlaceholder(),
  }) {
    return ArtistClient(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as Identifier,
      createdAt: createdAt == const $CopyWithPlaceholder() || createdAt == null
          ? _value.createdAt
          // ignore: cast_nullable_to_non_nullable
          : createdAt as DateTime,
      updatedAt: updatedAt == const $CopyWithPlaceholder() || updatedAt == null
          ? _value.updatedAt
          // ignore: cast_nullable_to_non_nullable
          : updatedAt as DateTime,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      inquiredAt:
          inquiredAt == const $CopyWithPlaceholder() || inquiredAt == null
              ? _value.inquiredAt
              // ignore: cast_nullable_to_non_nullable
              : inquiredAt as DateTime,
      artistId: artistId == const $CopyWithPlaceholder() || artistId == null
          ? _value.artistId
          // ignore: cast_nullable_to_non_nullable
          : artistId as Identifier,
      clientId: clientId == const $CopyWithPlaceholder()
          ? _value.clientId
          // ignore: cast_nullable_to_non_nullable
          : clientId as Identifier?,
    );
  }
}

extension $ArtistClientCopyWith on ArtistClient {
  /// Returns a callable class that can be used as follows: `instanceOfArtistClient.copyWith(...)` or like so:`instanceOfArtistClient.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ArtistClientCWProxy get copyWith => _$ArtistClientCWProxyImpl(this);
}
