import 'package:ink_relay/artist/providers/artist_service_provider.dart';
import 'package:ink_relay/artist/providers/user_artist_provider.dart';
import 'package:ink_relay/utils/models/contact_email.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_artist_contact_email_controller.g.dart';

@riverpod
class UpdateArtistContactEmailController
    extends _$UpdateArtistContactEmailController {
  @override
  FutureOr<void> build() {}

  Future<void> updateArtistContactEmail(String email) async {
    state = const AsyncLoading();
    try {
      final contactEmail = ContactEmail(email);
      final updatedArtist =
          ref.read(userArtistProvider).requireValue.updateEmail(contactEmail);
      final _ =
          await ref.read(artistServiceProvider).updateUserArtist(updatedArtist);
      ref.invalidate(userArtistProvider);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
