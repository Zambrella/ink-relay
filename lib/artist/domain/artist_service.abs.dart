import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/common/models/photo_upload.dart';

abstract class ArtistService {
  /// Get the current user's `Artist`.
  Future<Artist> getUserArtist();

  /// Update the current user's `Artist`.
  Future<Artist> updateUserArtist(Artist artist);

  /// Upload the current user's profile picture.
  Future<Artist> uploadUserArtistProfilePicture(PhotoUpload photoUpload);
}
