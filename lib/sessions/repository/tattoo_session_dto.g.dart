// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tattoo_session_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TattooSessionDtoImpl _$$TattooSessionDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$TattooSessionDtoImpl(
      $id: json[r'$id'] as String,
      $createdAt: DateTime.parse(json[r'$createdAt'] as String),
      $updatedAt: DateTime.parse(json[r'$updatedAt'] as String),
      when: DateTime.parse(json['when'] as String),
      duration: (json['duration'] as num).toInt(),
      status: json['status'] as String,
      artist: TattooSessionDto._artistIdFromJson(json, 'artist') as String,
      contact: ContactDto.fromJson(json['contact'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$TattooSessionDtoImplToJson(
        _$TattooSessionDtoImpl instance) =>
    <String, dynamic>{
      'when': instance.when.toIso8601String(),
      'duration': instance.duration,
      'status': instance.status,
      'artist': instance.artist,
      'contact': TattooSessionDto._contactToJson(instance.contact),
      'notes': instance.notes,
    };
