import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/artist/domain/artist_service.abs.dart';
import 'package:ink_relay/artist/repository/artist_repository.dart';
import 'package:ink_relay/common/models/photo_upload.dart';

class ArtistServiceImpl implements ArtistService {
  const ArtistServiceImpl(this._artistRepository);

  final ArtistRepository _artistRepository;

  @override
  Future<Artist> getUserArtist() async {
    final artistDto = await _artistRepository.getUserArtist();
    final name = 'Joe Doe'; // TODO: Get the user's name from the user service
    final artist = artistDto.toDomain(artistName: name);
    return artist;
  }

  @override
  Future<Artist> updateUserArtist(Artist artist) {
    // TODO: implement updateUserArtist
    throw UnimplementedError();
  }

  @override
  Future<Artist> uploadUserArtistProfilePicture(PhotoUpload photoUpload) {
    // TODO: implement uploadUserArtistProfilePicture
    throw UnimplementedError();
  }
}
