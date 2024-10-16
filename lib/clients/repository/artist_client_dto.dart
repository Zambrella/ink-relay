import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ink_relay/clients/domain/artist_client.dart';
import 'package:ink_relay/common/models.dart';

part 'artist_client_dto.freezed.dart';
part 'artist_client_dto.g.dart';

@freezed
class ArtistClientDto with _$ArtistClientDto {
  const factory ArtistClientDto({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String $id,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required DateTime $createdAt,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required DateTime $updatedAt,
    required String name,
    required DateTime inquiredAt,
    // ignore: invalid_annotation_target
    @JsonKey(readValue: ArtistClientDto.artistIdFromJson)
    required String artist,
  }) = _ArtistClientDto;

  const ArtistClientDto._();

  factory ArtistClientDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistClientDtoFromJson(json);

  factory ArtistClientDto.fromDomain(ArtistClient artist) {
    return ArtistClientDto(
      $id: artist.id.toString(),
      $createdAt: artist.createdAt,
      $updatedAt: artist.updatedAt,
      name: artist.name,
      inquiredAt: artist.inquiredAt,
      artist: artist.artistId.toString(),
    );
  }

  static Object? artistIdFromJson(Map<dynamic, dynamic> json, String key) {
    // If the relation has been expanded, return just the id.
    if (json['artist'] is Map) {
      return (json['artist'] as Map<String, dynamic>)[r'$id'];
    } else {
      return json[key];
    }
  }

  ArtistClient toDomain() {
    return ArtistClient(
      id: Identifier($id),
      createdAt: $createdAt,
      updatedAt: $updatedAt,
      name: name,
      inquiredAt: inquiredAt,
      artistId: Identifier(artist),
    );
  }
}
