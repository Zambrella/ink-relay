import 'package:analytics_core/analytics_core.dart';
import 'package:appwrite/appwrite.dart';
import 'package:data_privacy/data_privacy.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ink_relay/app_dependencies.dart';
import 'package:ink_relay/authentication/repository/appwrite_auth_repository.dart';
import 'package:purchases_core/purchases_core.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'repository_providers.g.dart';

@Riverpod(keepAlive: true)
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  // requiredValue is possible because `appDependenciesProvider` is loaded in `lib/app.dart`
  return ref.watch(appDependenciesProvider
      .select((deps) => deps.requireValue.sharedPreferences));
}

@Riverpod(keepAlive: true)
Client appwriteClient(AppwriteClientRef ref) {
  return ref.watch(appDependenciesProvider
      .select((deps) => deps.requireValue.backendClient));
}

@Riverpod(keepAlive: true)
Account appwriteAccountClient(AppwriteAccountClientRef ref) {
  return Account(ref.watch(appwriteClientProvider));
}

@Riverpod(keepAlive: true)
Databases appwriteDatabaseClient(AppwriteDatabaseClientRef ref) {
  return Databases(ref.watch(appwriteClientProvider));
}

@Riverpod(keepAlive: true)
Storage appwriteStorageClient(AppwriteStorageClientRef ref) {
  return Storage(ref.watch(appwriteClientProvider));
}

@Riverpod(keepAlive: true)
AppwriteAuthRepository authRepository(AuthRepositoryRef ref) {
  return AppwriteAuthRepository(
    ref.watch(appwriteAccountClientProvider),
    ref.watch(secureStorageProvider),
  );
}

@Riverpod(keepAlive: true)
AnalyticsRepository analyticsRepository(AnalyticsRepositoryRef ref) {
  return FakeAnalyticsRepository();
}

@Riverpod(keepAlive: true)
PurchasesRepository purchasesRepository(PurchasesRepositoryRef ref) {
  return FakePurchasesRepository();
}

@Riverpod(keepAlive: true)
DataPrivacyRepository dataPrivacyRepository(DataPrivacyRepositoryRef ref) {
  return DataPrivacyRepository(ref.watch(sharedPreferencesProvider));
}

@Riverpod(keepAlive: true)
FlutterSecureStorage secureStorage(SecureStorageRef ref) {
  return const FlutterSecureStorage();
}
