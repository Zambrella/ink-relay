import 'package:ink_relay/artist/providers/artist_service_provider.dart';
import 'package:ink_relay/artist/providers/user_artist_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_artist_name_controller.g.dart';

@riverpod
class UpdateArtistNameController extends _$UpdateArtistNameController {
  @override
  FutureOr<void> build() {}

  Future<void> updateArtistName(String name) async {
    state = const AsyncLoading();
    await Future.delayed(const Duration(seconds: 10));
    try {
      final updatedArtist =
          ref.read(userArtistProvider).requireValue.updateName(name);
      final _ =
          await ref.read(artistServiceProvider).updateUserArtist(updatedArtist);
      ref.invalidate(userArtistProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
