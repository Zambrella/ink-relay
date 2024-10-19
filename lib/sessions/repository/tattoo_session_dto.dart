// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ink_relay/clients/repository/contact_dto.dart';
import 'package:ink_relay/common/models.dart';
import 'package:ink_relay/sessions/domain/tattoo_session.dart';

part 'tattoo_session_dto.freezed.dart';
part 'tattoo_session_dto.g.dart';

@freezed
class TattooSessionDto with _$TattooSessionDto {
  const factory TattooSessionDto({
    @JsonKey(includeToJson: false) required String $id,
    @JsonKey(includeToJson: false) required DateTime $createdAt,
    @JsonKey(includeToJson: false) required DateTime $updatedAt,
    required DateTime when,
    required int duration,
    required String status,
    // Not interested in the entire artist object, just the id.
    @JsonKey(readValue: TattooSessionDto._artistIdFromJson)
    required String artist,
    // Only need to save the id to the database because it's a relation.
    @JsonKey(toJson: TattooSessionDto._contactToJson)
    required ContactDto contact,
    String? notes,
  }) = _TattooSessionDto;

  const TattooSessionDto._();

  factory TattooSessionDto.fromJson(Map<String, dynamic> json) =>
      _$TattooSessionDtoFromJson(json);

  factory TattooSessionDto.fromDomain(TattooSession artist) {
    return TattooSessionDto(
      $id: artist.id.toString(),
      $createdAt: artist.createdAt,
      $updatedAt: artist.updatedAt,
      when: artist.when,
      duration: artist.duration.inMinutes,
      status: artist.status,
      notes: artist.notes,
      artist: artist.artistId.toString(),
      contact: ContactDto.fromDomain(artist.contact),
    );
  }

  static String _contactToJson(ContactDto contact) {
    return contact.$id;
  }

  static Object? _artistIdFromJson(Map<dynamic, dynamic> json, String key) {
    // If the relation has been expanded, return just the id.
    if (json['artist'] is Map) {
      return (json['artist'] as Map<String, dynamic>)[r'$id'];
    } else {
      return json[key];
    }
  }

  TattooSession toDomain() {
    return TattooSession(
      id: Identifier($id),
      createdAt: $createdAt,
      updatedAt: $updatedAt,
      when: when,
      duration: Duration(minutes: duration),
      status: status,
      notes: notes,
      artistId: Identifier(artist),
      contact: contact.toDomain(),
    );
  }
}
