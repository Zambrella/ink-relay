import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ink_relay/common/models.dart';

part 'contact.g.dart';

@CopyWith()
class Contact extends Equatable {
  const Contact({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.name,
    required this.inquiredAt,
    required this.artistId,
    this.profilePictureId,
  });

  /// The unique identifier for the contact.
  final Identifier id;

  /// When the contact was created.
  final DateTime createdAt;

  /// When the contact was last updated.
  final DateTime updatedAt;

  /// The name of the client.
  final String name;

  final String? profilePictureId;

  /// The date the client inquired about the artist.
  final DateTime inquiredAt;

  /// The artist that the client belongs to.
  final Identifier artistId;

  @override
  List<Object?> get props => [
        id,
        createdAt,
        updatedAt,
        artistId,
        name,
        inquiredAt,
        artistId,
        profilePictureId,
      ];

  Contact updateName(String newName) => copyWith(name: newName);
}
