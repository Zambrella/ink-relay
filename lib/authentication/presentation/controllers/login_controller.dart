import 'dart:async';

import 'package:ink_relay/app_dependencies.dart';
import 'package:ink_relay/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final _ = await ref.read(authRepositoryProvider).logIn(
            email: email,
            password: password,
          );
      // Needed to let the user auth state to propogate through providers
      await Future<void>.delayed(const Duration(milliseconds: 100));
      state = const AsyncData(null);
    } catch (e, st) {
      ref.read(loggerProvider).e(e, stackTrace: st);
      state = AsyncError(e, st);
    }
  }
}
