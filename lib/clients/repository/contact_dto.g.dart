// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactDtoImpl _$$ContactDtoImplFromJson(Map<String, dynamic> json) =>
    _$ContactDtoImpl(
      $id: json[r'$id'] as String,
      $createdAt: DateTime.parse(json[r'$createdAt'] as String),
      $updatedAt: DateTime.parse(json[r'$updatedAt'] as String),
      name: json['name'] as String,
      inquiredAt: DateTime.parse(json['inquiredAt'] as String),
      artist: ContactDto.artistIdFromJson(json, 'artist') as String,
    );

Map<String, dynamic> _$$ContactDtoImplToJson(_$ContactDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'inquiredAt': instance.inquiredAt.toIso8601String(),
      'artist': instance.artist,
    };
