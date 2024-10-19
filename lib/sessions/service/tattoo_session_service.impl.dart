import 'package:ink_relay/sessions/domain/tattoo_session.dart';
import 'package:ink_relay/sessions/domain/tattoo_session_service.abs.dart';
import 'package:ink_relay/sessions/repository/tattoo_session_repository.dart';

class TattooSessionServiceImpl implements TattooSessionService {
  const TattooSessionServiceImpl(this._tattooSessionRepository);

  final TattooSessionRepository _tattooSessionRepository;

  @override
  Future<TattooSession> createTattooSession(TattooSession tattooSession) async {
    final tattooSessionDto =
        await _tattooSessionRepository.createTattooSession(tattooSession);
    final newTattooSession = tattooSessionDto.toDomain();
    return newTattooSession;
  }

  @override
  Future<void> deleteTattooSession(String id) {
    // TODO: implement deleteTattooSession
    throw UnimplementedError();
  }

  @override
  Future<List<TattooSession>> getContactTattooSessions(
      String artistId, String contactId,
      {DateTime? start, DateTime? end}) {
    // TODO: implement getContactTattooSessions
    throw UnimplementedError();
  }

  @override
  Future<TattooSession> getTattooSession(String id) {
    // TODO: implement getTattooSession
    throw UnimplementedError();
  }

  @override
  Future<List<TattooSession>> getTattooSessions(
    String artistId, {
    required DateTime start,
    required DateTime end,
  }) async {
    final tattooSessionDtos = await _tattooSessionRepository.getTattooSessions(
      artistId,
      start: start,
      end: end,
    );
    final sessions = tattooSessionDtos.map((e) => e.toDomain()).toList();
    return sessions;
  }

  @override
  Future<TattooSession> updateTattooSession(TattooSession tattooSession) {
    // TODO: implement updateTattooSession
    throw UnimplementedError();
  }
}
