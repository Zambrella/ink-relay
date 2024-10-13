import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/common/models.dart';

part 'artist_dto.freezed.dart';
part 'artist_dto.g.dart';

@freezed
class ArtistDto with _$ArtistDto {
  const factory ArtistDto({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String $id,
    required String email,
    required String name,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required DateTime $createdAt,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required DateTime $updatedAt,
    String? profileImage,
    String? phoneNumber,
  }) = _ArtistDto;

  const ArtistDto._();

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);

  factory ArtistDto.fromDomain(Artist artist) {
    return ArtistDto(
      $id: artist.id.toString(),
      email: artist.email.toString(),
      name: artist.name,
      $createdAt: artist.createdAt,
      $updatedAt: artist.updatedAt,
      profileImage: artist.profilePictureId,
      phoneNumber: artist.phoneNumber?.toString(),
    );
  }

  Artist toDomain() {
    return Artist(
      id: Identifier($id),
      name: name,
      createdAt: $createdAt,
      updatedAt: $updatedAt,
      profilePictureId: profileImage,
      phoneNumber: phoneNumber != null ? PhoneNumber(phoneNumber!) : null,
      email: ContactEmail(email),
    );
  }
}
