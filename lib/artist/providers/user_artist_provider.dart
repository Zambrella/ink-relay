import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/artist/providers/artist_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_artist_provider.g.dart';

@riverpod
Future<Artist> userArtist(UserArtistRef ref) async {
  return ref.watch(artistServiceProvider).getUserArtist();
}
