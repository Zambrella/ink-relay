// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ir_app_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$IrAppUserCWProxy {
  IrAppUser id(String id);

  IrAppUser authMethod(AuthMethod authMethod);

  IrAppUser email(String? email);

  IrAppUser name(String? name);

  IrAppUser labels(List<String> labels);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IrAppUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IrAppUser(...).copyWith(id: 12, name: "My name")
  /// ````
  IrAppUser call({
    String? id,
    AuthMethod? authMethod,
    String? email,
    String? name,
    List<String>? labels,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfIrAppUser.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfIrAppUser.copyWith.fieldName(...)`
class _$IrAppUserCWProxyImpl implements _$IrAppUserCWProxy {
  const _$IrAppUserCWProxyImpl(this._value);

  final IrAppUser _value;

  @override
  IrAppUser id(String id) => this(id: id);

  @override
  IrAppUser authMethod(AuthMethod authMethod) => this(authMethod: authMethod);

  @override
  IrAppUser email(String? email) => this(email: email);

  @override
  IrAppUser name(String? name) => this(name: name);

  @override
  IrAppUser labels(List<String> labels) => this(labels: labels);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `IrAppUser(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// IrAppUser(...).copyWith(id: 12, name: "My name")
  /// ````
  IrAppUser call({
    Object? id = const $CopyWithPlaceholder(),
    Object? authMethod = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? labels = const $CopyWithPlaceholder(),
  }) {
    return IrAppUser(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      authMethod:
          authMethod == const $CopyWithPlaceholder() || authMethod == null
              ? _value.authMethod
              // ignore: cast_nullable_to_non_nullable
              : authMethod as AuthMethod,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      labels: labels == const $CopyWithPlaceholder() || labels == null
          ? _value.labels
          // ignore: cast_nullable_to_non_nullable
          : labels as List<String>,
    );
  }
}

extension $IrAppUserCopyWith on IrAppUser {
  /// Returns a callable class that can be used as follows: `instanceOfIrAppUser.copyWith(...)` or like so:`instanceOfIrAppUser.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$IrAppUserCWProxy get copyWith => _$IrAppUserCWProxyImpl(this);
}
