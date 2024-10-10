import 'dart:async';

import 'package:analytics_core/analytics_core.dart';
import 'package:ink_relay/app_dependencies.dart';
import 'package:ink_relay/repository_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> register(String email, String password) async {
    state = const AsyncLoading();
    try {
      final _ = await ref.read(authRepositoryProvider).signUp(
            email: email,
            password: password,
          );
      await ref.read(analyticsRepositoryProvider).logCustomEvent(
            RegisterCustomEvent(email: email),
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

class RegisterCustomEvent extends CustomAnalyticsEvent {
  RegisterCustomEvent({required String email})
      : super('register', parameters: {'email': email});
}
