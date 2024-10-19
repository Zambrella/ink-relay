import 'package:ink_relay/repository_providers.dart';
import 'package:ink_relay/sessions/repository/tattoo_session_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tattoo_session_repository_provider.g.dart';

@Riverpod(keepAlive: true)
TattooSessionRepository tattooSessionRepository(
  TattooSessionRepositoryRef ref,
) {
  return TattooSessionRepository(
    account: ref.watch(appwriteAccountClientProvider),
    db: ref.watch(appwriteDatabaseClientProvider),
    storage: ref.watch(appwriteStorageClientProvider),
  );
}
