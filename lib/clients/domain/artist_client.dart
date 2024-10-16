import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ink_relay/common/models.dart';

part 'artist_client.g.dart';

@CopyWith()
class ArtistClient extends Equatable {
  const ArtistClient({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.inquiredAt,
    required this.artistId,
    this.clientId,
  });

  final Identifier id;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// The name of the client.
  final String name;

  /// The date the client inquired about the artist.
  final DateTime inquiredAt;

  /// The artist that the client belongs to.
  final Identifier artistId;

  /// The client that the artist belongs to.
  final Identifier? clientId;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        artistId,
        clientId,
        name,
        inquiredAt,
        artistId,
        clientId,
      ];
}
