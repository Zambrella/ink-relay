import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:ink_relay/artist/repository/artist_dto.dart';
import 'package:ink_relay/common/appwrite_ids.dart';
import 'package:ink_relay/utils/extensions/pretty_print_map.dart';

class ArtistRepository {
  const ArtistRepository({
    required this.account,
    required this.db,
    required this.storage,
  });

  final Account account;
  final Databases db;
  final Storage storage;

  Future<ArtistDto> getUserArtist() async {
    try {
      final user = await account.get();
      final userId = user.$id;
      final artistDocs = await db.listDocuments(
        databaseId: AppwriteIds.mainDatbaseId,
        collectionId: AppwriteIds.artistCollectionId,
        queries: [
          Query.equal('userId', userId),
        ],
      );
      assert(
        artistDocs.documents.length == 1,
        'Expected 1 artist document for user $userId, found ${artistDocs.documents.length}',
      );
      final artistDoc = artistDocs.documents.first;
      log(
        'Artist document found: ${artistDoc.data.prettyPrintMap()}',
        name: 'ArtistRepository',
      );
      final artistDto = ArtistDto.fromJson(artistDoc.data);
      return artistDto;
    } catch (e, st) {
      log(
        e.toString(),
        error: e,
        stackTrace: st,
        name: 'ArtistRepository',
      );
      rethrow;
    }
  }
}
