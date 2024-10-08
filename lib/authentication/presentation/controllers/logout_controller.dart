import 'package:ink_relay/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logout_controller.g.dart';

@riverpod
class LogoutController extends _$LogoutController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    try {
      await ref.watch(authRepositoryProvider).logOut();
      // Needed to let the user auth state to propogate through providers
      await Future<void>.delayed(const Duration(milliseconds: 100));
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
