import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:ink_relay/clients/repository/artist_client_dto.dart';
import 'package:ink_relay/common/appwrite_ids.dart';

class ArtistClientRepository {
  const ArtistClientRepository({
    required this.account,
    required this.db,
    required this.storage,
  });

  final Account account;
  final Databases db;
  final Storage storage;

  Future<ArtistClientDto> createArtistClient(ArtistClientDto artistClient) {
    // TODO: implement createArtistClient
    throw UnimplementedError();
  }

  Future<List<ArtistClientDto>> getAllArtistClients(String artistId) async {
    log(
      'Getting all artist clients',
      name: 'ArtistClientRepository',
    );
    try {
      final docList = await db.listDocuments(
        databaseId: AppwriteIds.mainDatbaseId,
        collectionId: AppwriteIds.artistClientCollectionId,
        queries: [
          Query.equal('artist', artistId),
        ],
      );
      final docs = docList.documents;
      final artistClients =
          docs.map((doc) => ArtistClientDto.fromJson(doc.data)).toList();
      log(
        'Found ${artistClients.length} artist clients for artist $artistId',
        name: 'ArtistClientRepository',
      );
      return artistClients;
    } catch (e, st) {
      log(
        e.toString(),
        error: e,
        stackTrace: st,
        name: 'ArtistClientRepository',
      );
      rethrow;
    }
  }

  Future<ArtistClientDto> getArtistClient(String id) {
    // TODO: implement getArtistClient
    throw UnimplementedError();
  }

  Future<ArtistClientDto> updateArtistClient(ArtistClientDto artistClient) {
    // TODO: implement updateArtistClient
    throw UnimplementedError();
  }
}
