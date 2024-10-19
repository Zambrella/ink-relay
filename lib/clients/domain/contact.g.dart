// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ContactCWProxy {
  Contact id(Identifier id);

  Contact createdAt(DateTime createdAt);

  Contact updatedAt(DateTime updatedAt);

  Contact name(String name);

  Contact inquiredAt(DateTime inquiredAt);

  Contact artistId(Identifier artistId);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Contact(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Contact(...).copyWith(id: 12, name: "My name")
  /// ````
  Contact call({
    Identifier? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? name,
    DateTime? inquiredAt,
    Identifier? artistId,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfContact.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfContact.copyWith.fieldName(...)`
class _$ContactCWProxyImpl implements _$ContactCWProxy {
  const _$ContactCWProxyImpl(this._value);

  final Contact _value;

  @override
  Contact id(Identifier id) => this(id: id);

  @override
  Contact createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  Contact updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  Contact name(String name) => this(name: name);

  @override
  Contact inquiredAt(DateTime inquiredAt) => this(inquiredAt: inquiredAt);

  @override
  Contact artistId(Identifier artistId) => this(artistId: artistId);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Contact(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Contact(...).copyWith(id: 12, name: "My name")
  /// ````
  Contact call({
    Object? id = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? inquiredAt = const $CopyWithPlaceholder(),
    Object? artistId = const $CopyWithPlaceholder(),
  }) {
    return Contact(
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
    );
  }
}

extension $ContactCopyWith on Contact {
  /// Returns a callable class that can be used as follows: `instanceOfContact.copyWith(...)` or like so:`instanceOfContact.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ContactCWProxy get copyWith => _$ContactCWProxyImpl(this);
}
