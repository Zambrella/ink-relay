// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArtistDtoImpl _$$ArtistDtoImplFromJson(Map<String, dynamic> json) =>
    _$ArtistDtoImpl(
      $id: json[r'$id'] as String,
      email: json['email'] as String,
      $createdAt: DateTime.parse(json[r'$createdAt'] as String),
      $updatedAt: DateTime.parse(json[r'$updatedAt'] as String),
      profileImage: json['profileImage'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$$ArtistDtoImplToJson(_$ArtistDtoImpl instance) =>
    <String, dynamic>{
      r'$id': instance.$id,
      'email': instance.email,
      r'$createdAt': instance.$createdAt.toIso8601String(),
      r'$updatedAt': instance.$updatedAt.toIso8601String(),
      'profileImage': instance.profileImage,
      'phoneNumber': instance.phoneNumber,
    };
