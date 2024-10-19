import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/common/models.dart';

part 'contact_dto.freezed.dart';
part 'contact_dto.g.dart';

@freezed
class ContactDto with _$ContactDto {
  const factory ContactDto({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String $id,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required DateTime $createdAt,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required DateTime $updatedAt,
    required String name,
    required DateTime inquiredAt,
    // ignore: invalid_annotation_target
    @JsonKey(readValue: ContactDto.artistIdFromJson) required String artist,
  }) = _ContactDto;

  const ContactDto._();

  factory ContactDto.fromJson(Map<String, dynamic> json) =>
      _$ContactDtoFromJson(json);

  factory ContactDto.fromDomain(Contact artist) {
    return ContactDto(
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

  Contact toDomain() {
    return Contact(
      id: Identifier($id),
      createdAt: $createdAt,
      updatedAt: $updatedAt,
      name: name,
      inquiredAt: inquiredAt,
      artistId: Identifier(artist),
    );
  }
}
