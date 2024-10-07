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

  Future<void> register() async {
    state = const AsyncLoading();
    try {
      await Future<void>.delayed(const Duration(seconds: 2));
      final _ = await ref.read(authRepositoryProvider).signUp(
            email: '1234@test.com',
            password: 'mag1c1an123',
          );
      // At this point, the app will have navigated to the login page.
      await ref.read(analyticsRepositoryProvider).logCustomEvent(
            RegisterCustomEvent(email: '1234@test.com'),
          );
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
