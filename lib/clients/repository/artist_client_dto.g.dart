// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_client_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistClientDtoImpl _$$ArtistClientDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ArtistClientDtoImpl(
      $id: json[r'$id'] as String,
      $createdAt: DateTime.parse(json[r'$createdAt'] as String),
      $updatedAt: DateTime.parse(json[r'$updatedAt'] as String),
      name: json['name'] as String,
      inquiredAt: DateTime.parse(json['inquiredAt'] as String),
      artist: ArtistClientDto.artistIdFromJson(json, 'artist') as String,
    );

Map<String, dynamic> _$$ArtistClientDtoImplToJson(
        _$ArtistClientDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'inquiredAt': instance.inquiredAt.toIso8601String(),
      'artist': instance.artist,
    };
