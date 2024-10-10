import 'package:ink_relay/artist/repository/artist_repository.dart';
import 'package:ink_relay/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artist_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ArtistRepository artistRepository(ArtistRepositoryRef ref) {
  return ArtistRepository(
    account: ref.watch(appwriteAccountClientProvider),
    db: ref.watch(appwriteDatabaseClientProvider),
    storage: ref.watch(appwriteStorageClientProvider),
  );
}
