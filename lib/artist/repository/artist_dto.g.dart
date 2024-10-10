// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistDtoImpl _$$ArtistDtoImplFromJson(Map<String, dynamic> json) =>
    _$ArtistDtoImpl(
      $id: json[r'$id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      $createdAt: DateTime.parse(json[r'$createdAt'] as String),
      $updatedAt: DateTime.parse(json[r'$updatedAt'] as String),
      profileImage: json['profileImage'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$ArtistDtoImplToJson(_$ArtistDtoImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'profileImage': instance.profileImage,
      'phoneNumber': instance.phoneNumber,
    };
