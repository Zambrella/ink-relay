import 'package:ink_relay/clients/domain/artist_client.dart';

/// Defines methods that the `ArtistClient` service must implement
/// based on the business logic of the application.
abstract class ArtistClientService {
  /// Get all [ArtistClient]s that belong to the current user/Aritst.
  Future<List<ArtistClient>> getAllArtistClients(String artistId);

  /// Get a [ArtistClient] by its [id].
  Future<ArtistClient> getArtistClient(String id);

  /// Create a new [ArtistClient].
  Future<ArtistClient> createArtistClient(
    ArtistClient artistClient,
    String artistId,
  );

  /// Update an existing [ArtistClient].
  Future<ArtistClient> updateArtistClient(
    ArtistClient artistClient,
    String artistId,
  );
}
