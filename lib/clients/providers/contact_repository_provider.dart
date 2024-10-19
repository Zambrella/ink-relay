import 'package:ink_relay/clients/repository/contact_repository.dart';
import 'package:ink_relay/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'contact_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ContactRepository contactRepository(ContactRepositoryRef ref) {
  return ContactRepository(
    account: ref.watch(appwriteAccountClientProvider),
    db: ref.watch(appwriteDatabaseClientProvider),
    storage: ref.watch(appwriteStorageClientProvider),
  );
}
