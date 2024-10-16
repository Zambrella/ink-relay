import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/artist/providers/artist_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_artist_provider.g.dart';

@Riverpod(keepAlive: true)
Future<Artist> userArtist(UserArtistRef ref) async {
  return ref.watch(artistServiceProvider).getUserArtist();
}

@Riverpod(keepAlive: true)
AsyncValue<String> userArtistId(UserArtistIdRef ref) {
  return ref
      .watch(userArtistProvider)
      .whenData((artist) => artist.id.toString());
}
