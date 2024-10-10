import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ink_relay/artist/domain/studio.dart';
import 'package:ink_relay/utils/models/contact_email.dart';
import 'package:ink_relay/utils/models/identifier.dart';
import 'package:ink_relay/utils/models/phone_number.dart';

part 'artist.g.dart';

@CopyWith()
class Artist implements Equatable {
  const Artist({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    this.email,
    this.phoneNumber,
    this.studio,
    this.profilePictureId,
  });

  final Identifier id;
  final String name;
  final ContactEmail? email;
  final PhoneNumber? phoneNumber;
  final Studio? studio;
  final String? profilePictureId;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        phoneNumber,
        studio,
        profilePictureId,
        createdAt,
        updatedAt,
      ];

  @override
  bool? get stringify => true;

  @override
  String toString() {
    return 'Artist(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, studio: $studio, profilePictureId: $profilePictureId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }
}
