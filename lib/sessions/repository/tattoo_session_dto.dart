import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ink_relay/common/models.dart';
import 'package:ink_relay/sessions/domain/tattoo_session.dart';

part 'tattoo_session_dto.freezed.dart';
part 'tattoo_session_dto.g.dart';

@freezed
class TattooSessionDto with _$TattooSessionDto {
  const factory TattooSessionDto({
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required String $id,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required DateTime $createdAt,
    // ignore: invalid_annotation_target
    @JsonKey(includeToJson: false) required DateTime $updatedAt,
    required DateTime when,
    required int duration,
    required String status,
    String? notes,
    // ignore: invalid_annotation_target
    // @JsonKey(readValue: TattooSessionDto.tatooSessionIdFromJson)
    // required String artist,
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
    );
  }

  // static Object? tatooSessionIdFromJson(Map<dynamic, dynamic> json, String key) {
  //   // If the relation has been expanded, return just the id.
  //   if (json['artist'] is Map) {
  //     return (json['artist'] as Map<String, dynamic>)[r'$id'];
  //   } else {
  //     return json[key];
  //   }
  // }

  TattooSession toDomain() {
    return TattooSession(
      id: Identifier($id),
      createdAt: $createdAt,
      updatedAt: $updatedAt,
      when: when,
      duration: Duration(minutes: duration),
      status: status,
      notes: notes,
    );
  }
}
