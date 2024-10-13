// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_client.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ArtistClientCWProxy {
  ArtistClient id(Identifier id);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ArtistClient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ArtistClient(...).copyWith(id: 12, name: "My name")
  /// ````
  ArtistClient call({
    Identifier? id,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfArtistClient.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfArtistClient.copyWith.fieldName(...)`
class _$ArtistClientCWProxyImpl implements _$ArtistClientCWProxy {
  const _$ArtistClientCWProxyImpl(this._value);

  final ArtistClient _value;

  @override
  ArtistClient id(Identifier id) => this(id: id);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ArtistClient(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ArtistClient(...).copyWith(id: 12, name: "My name")
  /// ````
  ArtistClient call({
    Object? id = const $CopyWithPlaceholder(),
  }) {
    return ArtistClient(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as Identifier,
    );
  }
}

extension $ArtistClientCopyWith on ArtistClient {
  /// Returns a callable class that can be used as follows: `instanceOfArtistClient.copyWith(...)` or like so:`instanceOfArtistClient.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ArtistClientCWProxy get copyWith => _$ArtistClientCWProxyImpl(this);
}
