import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:ink_relay/clients/repository/contact_dto.dart';
import 'package:ink_relay/common/appwrite_ids.dart';

class ContactRepository {
  const ContactRepository({
    required this.account,
    required this.db,
    required this.storage,
  });

  final Account account;
  final Databases db;
  final Storage storage;

  Future<ContactDto> createContact(ContactDto artistClient) {
    // TODO: implement createArtistClient
    throw UnimplementedError();
  }

  Future<List<ContactDto>> getAllContacts(String artistId) async {
    log(
      "Getting all artist's contacts",
      name: 'ContactRepository',
    );
    try {
      final docList = await db.listDocuments(
        databaseId: AppwriteIds.mainDatabaseId,
        collectionId: AppwriteIds.contactCollectionId,
        queries: [
          Query.equal('artist', artistId),
        ],
      );
      final docs = docList.documents;
      final contacts =
          docs.map((doc) => ContactDto.fromJson(doc.data)).toList();
      log(
        'Found ${contacts.length} contacts for artist $artistId',
        name: 'ContactRepository',
      );
      return contacts;
    } catch (e, st) {
      log(
        e.toString(),
        error: e,
        stackTrace: st,
        name: 'ContactRepository',
      );
      rethrow;
    }
  }

  Future<ContactDto> getContact(String id) async {
    log(
      'Fetching contact with id: $id',
      name: 'ContactRepository',
    );
    try {
      final doc = await db.getDocument(
        databaseId: AppwriteIds.mainDatabaseId,
        collectionId: AppwriteIds.contactCollectionId,
        documentId: id,
      );
      final contactDto = ContactDto.fromJson(doc.data);
      return contactDto;
    } catch (e, st) {
      log(
        e.toString(),
        error: e,
        stackTrace: st,
        name: 'ContactRepository',
      );
      rethrow;
    }
  }

  Future<ContactDto> updateContact(ContactDto artistClient) {
    // TODO: implement updateArtistClient
    throw UnimplementedError();
  }
}
