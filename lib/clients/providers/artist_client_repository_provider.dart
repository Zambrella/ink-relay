import 'package:ink_relay/clients/repository/artist_client_repository.dart';
import 'package:ink_relay/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artist_client_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ArtistClientRepository artistClientRepository(ArtistClientRepositoryRef ref) {
  return ArtistClientRepository(
    account: ref.watch(appwriteAccountClientProvider),
    db: ref.watch(appwriteDatabaseClientProvider),
    storage: ref.watch(appwriteStorageClientProvider),
  );
}
