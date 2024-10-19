// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tattoo_session.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$TattooSessionCWProxy {
  TattooSession id(Identifier id);

  TattooSession createdAt(DateTime createdAt);

  TattooSession updatedAt(DateTime updatedAt);

  TattooSession when(DateTime when);

  TattooSession duration(Duration duration);

  TattooSession status(String status);

  TattooSession notes(String? notes);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TattooSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TattooSession(...).copyWith(id: 12, name: "My name")
  /// ````
  TattooSession call({
    Identifier? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? when,
    Duration? duration,
    String? status,
    String? notes,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfTattooSession.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfTattooSession.copyWith.fieldName(...)`
class _$TattooSessionCWProxyImpl implements _$TattooSessionCWProxy {
  const _$TattooSessionCWProxyImpl(this._value);

  final TattooSession _value;

  @override
  TattooSession id(Identifier id) => this(id: id);

  @override
  TattooSession createdAt(DateTime createdAt) => this(createdAt: createdAt);

  @override
  TattooSession updatedAt(DateTime updatedAt) => this(updatedAt: updatedAt);

  @override
  TattooSession when(DateTime when) => this(when: when);

  @override
  TattooSession duration(Duration duration) => this(duration: duration);

  @override
  TattooSession status(String status) => this(status: status);

  @override
  TattooSession notes(String? notes) => this(notes: notes);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `TattooSession(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// TattooSession(...).copyWith(id: 12, name: "My name")
  /// ````
  TattooSession call({
    Object? id = const $CopyWithPlaceholder(),
    Object? createdAt = const $CopyWithPlaceholder(),
    Object? updatedAt = const $CopyWithPlaceholder(),
    Object? when = const $CopyWithPlaceholder(),
    Object? duration = const $CopyWithPlaceholder(),
    Object? status = const $CopyWithPlaceholder(),
    Object? notes = const $CopyWithPlaceholder(),
  }) {
    return TattooSession(
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
      when: when == const $CopyWithPlaceholder() || when == null
          ? _value.when
          // ignore: cast_nullable_to_non_nullable
          : when as DateTime,
      duration: duration == const $CopyWithPlaceholder() || duration == null
          ? _value.duration
          // ignore: cast_nullable_to_non_nullable
          : duration as Duration,
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as String,
      notes: notes == const $CopyWithPlaceholder()
          ? _value.notes
          // ignore: cast_nullable_to_non_nullable
          : notes as String?,
    );
  }
}

extension $TattooSessionCopyWith on TattooSession {
  /// Returns a callable class that can be used as follows: `instanceOfTattooSession.copyWith(...)` or like so:`instanceOfTattooSession.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$TattooSessionCWProxy get copyWith => _$TattooSessionCWProxyImpl(this);
}
