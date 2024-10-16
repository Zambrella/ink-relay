import 'package:ink_relay/clients/domain/artist_client.dart';
import 'package:ink_relay/clients/domain/artist_client_service.abs.dart';
import 'package:ink_relay/clients/repository/artist_client_repository.dart';

class ArtistClientServiceImpl implements ArtistClientService {
  const ArtistClientServiceImpl(this._artistClientRepository);

  final ArtistClientRepository _artistClientRepository;

  @override
  Future<ArtistClient> createArtistClient(
    ArtistClient artistClient,
    String artistId,
  ) {
    // TODO: implement createArtistClient
    throw UnimplementedError();
  }

  @override
  Future<List<ArtistClient>> getAllArtistClients(String artistId) async {
    final artistClientDtos =
        await _artistClientRepository.getAllArtistClients(artistId);
    final artistClients =
        artistClientDtos.map((dto) => dto.toDomain()).toList();
    return artistClients;
  }

  @override
  Future<ArtistClient> getArtistClient(String id) {
    // TODO: implement getArtistClient
    throw UnimplementedError();
  }

  @override
  Future<ArtistClient> updateArtistClient(
    ArtistClient artistClient,
    String artistId,
  ) {
    // TODO: implement updateArtistClient
    throw UnimplementedError();
  }
}
