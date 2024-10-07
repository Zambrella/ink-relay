// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studio.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$StudioCWProxy {
  Studio id(Identifier id);

  Studio name(String name);

  Studio address(String address);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Studio(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Studio(...).copyWith(id: 12, name: "My name")
  /// ````
  Studio call({
    Identifier? id,
    String? name,
    String? address,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfStudio.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfStudio.copyWith.fieldName(...)`
class _$StudioCWProxyImpl implements _$StudioCWProxy {
  const _$StudioCWProxyImpl(this._value);

  final Studio _value;

  @override
  Studio id(Identifier id) => this(id: id);

  @override
  Studio name(String name) => this(name: name);

  @override
  Studio address(String address) => this(address: address);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `Studio(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// Studio(...).copyWith(id: 12, name: "My name")
  /// ````
  Studio call({
    Object? id = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? address = const $CopyWithPlaceholder(),
  }) {
    return Studio(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as Identifier,
      name: name == const $CopyWithPlaceholder() || name == null
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String,
      address: address == const $CopyWithPlaceholder() || address == null
          ? _value.address
          // ignore: cast_nullable_to_non_nullable
          : address as String,
    );
  }
}

extension $StudioCopyWith on Studio {
  /// Returns a callable class that can be used as follows: `instanceOfStudio.copyWith(...)` or like so:`instanceOfStudio.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$StudioCWProxy get copyWith => _$StudioCWProxyImpl(this);
}
