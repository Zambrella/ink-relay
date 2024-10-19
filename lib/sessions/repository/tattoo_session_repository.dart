import 'dart:developer';

import 'package:appwrite/appwrite.dart';
import 'package:ink_relay/common/appwrite_ids.dart';
import 'package:ink_relay/sessions/domain/tattoo_session.dart';
import 'package:ink_relay/sessions/repository/tattoo_session_dto.dart';

class TattooSessionRepository {
  const TattooSessionRepository({
    required this.account,
    required this.db,
    required this.storage,
  });

  final Account account;
  final Databases db;
  final Storage storage;

  Future<TattooSessionDto> createTattooSession(
    TattooSession tattooSession,
  ) async {
    try {
      log(
        'Creating tattoo session',
        name: 'TattooSessionRepository',
      );
      final sessionDto = TattooSessionDto.fromDomain(tattooSession);
      await db.createDocument(
        databaseId: AppwriteIds.mainDatabaseId,
        collectionId: AppwriteIds.sessionCollectionId,
        documentId: sessionDto.$id,
        data: sessionDto.toJson(),
      );
      return sessionDto;
    } catch (e, st) {
      log(
        e.toString(),
        error: e,
        stackTrace: st,
        name: 'TattooSessionRepository',
      );
      rethrow;
    }
  }

  Future<List<TattooSessionDto>> getTattooSessions(
    String artistId, {
    required DateTime start,
    required DateTime end,
  }) async {
    try {
      log(
        'Getting tattoo sessions for $artistId, between $start and $end',
        name: 'TattooSessionRepository',
      );
      final documentList = await db.listDocuments(
        databaseId: AppwriteIds.mainDatabaseId,
        collectionId: AppwriteIds.sessionCollectionId,
        queries: [
          Query.equal('artist', artistId),
          Query.greaterThanEqual('when', start.toUtc().toIso8601String()),
          Query.lessThanEqual('when', end.toUtc().toIso8601String()),
        ],
      );
      final documents = documentList.documents;
      final sessions = documents
          .map((doc) => TattooSessionDto.fromJson(doc.data))
          .toList(growable: false);
      log(
        'Found ${sessions.length} sessions',
        name: 'TattooSessionRepository',
      );
      return sessions;
    } catch (e, st) {
      log(
        e.toString(),
        error: e,
        stackTrace: st,
        name: 'TattooSessionRepository',
      );
      rethrow;
    }
  }

  Future<TattooSession> getTattooSession(String id) {
    throw UnimplementedError();
  }

  Future<TattooSession> updateTattooSession(TattooSession tattooSession) {
    throw UnimplementedError();
  }

  Future<void> deleteTattooSession(String id) {
    throw UnimplementedError();
  }

  Future<List<TattooSession>> getContactTattooSessions(
    String artistId,
    String contactId, {
    DateTime? start,
    DateTime? end,
  }) {
    throw UnimplementedError();
  }
}
