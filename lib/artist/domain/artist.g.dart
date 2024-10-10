// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ArtistCWProxy {
  Artist id(Identifier id);

  Artist name(String name);

  Artist email(ContactEmail? email);

  Artist phoneNumber(PhoneNumber? phoneNumber);

  Artist studio(Studio? studio);

  Artist profilePictureId(String? profilePictureId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Artist(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Artist(...).copyWith(id: 12, name: "My name")
  /// ````
  Artist call({
    Identifier? id,
    String? name,
    ContactEmail? email,
    PhoneNumber? phoneNumber,
    Studio? studio,
    String? profilePictureId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfArtist.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfArtist.copyWith.fieldName(...)`
class _$ArtistCWProxyImpl implements _$ArtistCWProxy {
  const _$ArtistCWProxyImpl(this._value);

  final Artist _value;

  @override
  Artist id(Identifier id) => this(id: id);

  @override
  Artist name(String name) => this(name: name);

  @override
  Artist email(ContactEmail? email) => this(email: email);

  @override
  Artist phoneNumber(PhoneNumber? phoneNumber) =>
      this(phoneNumber: phoneNumber);

  @override
  Artist studio(Studio? studio) => this(studio: studio);

  @override
  Artist profilePictureId(String? profilePictureId) =>
      this(profilePictureId: profilePictureId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Artist(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Artist(...).copyWith(id: 12, name: "My name")
  /// ````
  Artist call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
    Object? studio = const $CopyWithPlaceholder(),
    Object? profilePictureId = const $CopyWithPlaceholder(),
  }) {
    return Artist(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as Identifier,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as ContactEmail?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as PhoneNumber?,
      studio: studio == const $CopyWithPlaceholder()
          ? _value.studio
          // ignore: cast_nullable_to_non_nullable
          : studio as Studio?,
      profilePictureId: profilePictureId == const $CopyWithPlaceholder()
          ? _value.profilePictureId
          // ignore: cast_nullable_to_non_nullable
          : profilePictureId as String?,
    );
  }
}

extension $ArtistCopyWith on Artist {
  /// Returns a callable class that can be used as follows: `instanceOfArtist.copyWith(...)` or like so:`instanceOfArtist.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ArtistCWProxy get copyWith => _$ArtistCWProxyImpl(this);
}
