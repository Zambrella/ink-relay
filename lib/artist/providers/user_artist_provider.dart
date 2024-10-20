import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/artist/providers/artist_service_provider.dart';
import 'package:ink_relay/common/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_artist_provider.g.dart';

// This is watched by the `main_app_wrapper.dart` file so can accessed synchronously
// throughout the app.
@Riverpod(keepAlive: true)
Future<Artist> userArtist(UserArtistRef ref) async {
  return ref.watch(artistServiceProvider).getUserArtist();
}

@Riverpod(keepAlive: true)
Identifier userArtistId(UserArtistIdRef ref) {
  return ref.watch(userArtistProvider).requireValue.id;
}
