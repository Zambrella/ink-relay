import 'package:ink_relay/artist/providers/user_artist_provider.dart';
import 'package:ink_relay/clients/domain/artist_client.dart';
import 'package:ink_relay/clients/providers/artist_client_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artist_client_list_provider.g.dart';

@riverpod
Future<List<ArtistClient>> artistClientList(ArtistClientListRef ref) async {
  // TODO: Confirm I can use `requireValue` here
  final artistId = ref.watch(userArtistIdProvider).requireValue;
  return ref.watch(artistClientServiceProvider).getAllArtistClients(artistId);
}
