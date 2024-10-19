import 'package:ink_relay/app_dependencies.dart';
import 'package:ink_relay/sessions/domain/tattoo_session.dart';
import 'package:ink_relay/sessions/providers/tattoo_session_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_new_session_controller.g.dart';

@riverpod
class CreateNewSessionController extends _$CreateNewSessionController {
  @override
  FutureOr<void> build() {
    return null;
  }

  Future<void> createNewTattooSession(TattooSession tattooSession) async {
    try {
      state = const AsyncValue.loading();
      final _ = await ref
          .read(tattooSessionServiceProvider)
          .createTattooSession(tattooSession);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      ref.read(loggerProvider).e(e, stackTrace: st);
      state = AsyncValue.error(e, st);
    }
  }
}
