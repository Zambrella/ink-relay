import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/utils/models/contact_email.dart';
import 'package:ink_relay/utils/models/identifier.dart';
import 'package:ink_relay/utils/models/phone_number.dart';

part 'artist_dto.freezed.dart';
part 'artist_dto.g.dart';

@freezed
class ArtistDto with _$ArtistDto {
  const factory ArtistDto({
    required String $id,
    required String email,
    required DateTime $createdAt,
    required DateTime $updatedAt,
    String? profileImage,
    String? phoneNumber,
  }) = _ArtistDto;

  const ArtistDto._();

  factory ArtistDto.fromJson(Map<String, dynamic> json) =>
      _$ArtistDtoFromJson(json);

  Artist toDomain({required String artistName}) {
    return Artist(
      id: Identifier($id),
      name: artistName,
      createdAt: $createdAt,
      updatedAt: $updatedAt,
      profilePictureId: profileImage,
      phoneNumber: phoneNumber != null ? PhoneNumber(phoneNumber!) : null,
      email: ContactEmail(email),
    );
  }
}
