import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:ink_relay/artist/domain/studio.dart';
import 'package:ink_relay/common/models.dart';

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

  Artist updateEmail(ContactEmail email) {
    final isValid = email.isValid;
    if (!isValid) {
      throw ArgumentError.value(
        email,
        'email',
        'Invalid email',
      );
    }
    return copyWith(email: email);
  }

  Artist updateName(String name) {
    if (name.isEmpty) {
      throw ArgumentError.value(
        name,
        'name',
        'Name cannot be empty',
      );
    }
    return copyWith(name: name);
  }

  Artist updateProfilePictureId(String profilePictureId) {
    if (profilePictureId.isEmpty) {
      throw ArgumentError.value(
        profilePictureId,
        'profilePictureId',
        'Profile picture ID cannot be empty',
      );
    }
    return copyWith(profilePictureId: profilePictureId);
  }
}
