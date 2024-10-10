import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/artist/domain/artist_service.abs.dart';
import 'package:ink_relay/artist/repository/artist_dto.dart';
import 'package:ink_relay/artist/repository/artist_repository.dart';
import 'package:ink_relay/common/models/photo_upload.dart';

class ArtistServiceImpl implements ArtistService {
  const ArtistServiceImpl(this._artistRepository);

  final ArtistRepository _artistRepository;

  @override
  Future<Artist> getUserArtist() async {
    final artistDto = await _artistRepository.getUserArtist();
    final artist = artistDto.toDomain();
    return artist;
  }

  @override
  Future<Artist> updateUserArtist(Artist artist) async {
    final artistDto = ArtistDto.fromDomain(artist);
    final updatedArtistDto =
        await _artistRepository.updateUserArtist(artistDto);
    final updatedArtist = updatedArtistDto.toDomain();
    return updatedArtist;
  }

  @override
  Future<Artist> uploadUserArtistProfilePicture(PhotoUpload photoUpload) {
    // TODO: implement uploadUserArtistProfilePicture
    throw UnimplementedError();
  }
}
