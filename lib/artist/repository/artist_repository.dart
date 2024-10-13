import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:ink_relay/artist/repository/artist_dto.dart';
import 'package:ink_relay/common/appwrite_ids.dart';
import 'package:ink_relay/common/extensions.dart';
import 'package:ink_relay/common/models/photo_upload.dart';

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

  Future<ArtistDto> updateUserArtist(ArtistDto artist) async {
    try {
      final artistDoc = await db.updateDocument(
        databaseId: AppwriteIds.mainDatbaseId,
        collectionId: AppwriteIds.artistCollectionId,
        documentId: artist.$id,
        data: artist.toJson(),
      );
      log(
        'Updated artist doc: ${artist.$id}',
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

  Future<String> uploadArtistPhoto(PhotoUpload photoUpload) async {
    final user = await account.get();
    final userId = user.$id;
    final file = await storage.createFile(
      bucketId: AppwriteIds.profilePictureStorageId,
      fileId: ID.unique(),
      file: InputFile.fromBytes(
        bytes: photoUpload.fileBytes,
        filename: '${userId}_profile_image.png',
      ),
      permissions: [
        Permission.read(Role.any()),
        Permission.write(Role.user(userId)),
        Permission.delete(Role.user(userId)),
        Permission.update(Role.user(userId)),
      ],
    );
    return file.$id;
  }
}
