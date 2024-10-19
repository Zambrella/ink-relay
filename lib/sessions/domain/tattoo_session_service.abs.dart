import 'package:ink_relay/sessions/domain/tattoo_session.dart';

abstract class TattooSessionService {
  const TattooSessionService();

  /// Creates a new `TattooSession`.
  Future<TattooSession> createTattooSession(TattooSession tattooSession);

  /// Retrieves all tattoo sessions for [artistId], between [start] and [end] times.
  Future<List<TattooSession>> getTattooSessions(
    String artistId, {
    required DateTime start,
    required DateTime end,
  });

  /// Get a specific tattoo session by its [id].
  Future<TattooSession> getTattooSession(String id);

  /// Updates an existing tattoo session.
  Future<TattooSession> updateTattooSession(TattooSession tattooSession);

  /// Deletes a tattoo session by its [id].
  Future<void> deleteTattooSession(String id);

  /// Retrieves all tattoo sessions for a specific [contactId].
  /// Optionally, you can filter by [start] and [end] times.
  /// Both [start] and [end] must be provided if you want to filter by time.
  Future<List<TattooSession>> getContactTattooSessions(
    String artistId,
    String contactId, {
    DateTime? start,
    DateTime? end,
  });
}
