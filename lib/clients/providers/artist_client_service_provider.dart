import 'package:ink_relay/clients/domain/artist_client_service.abs.dart';
import 'package:ink_relay/clients/providers/artist_client_repository_provider.dart';
import 'package:ink_relay/clients/service/artist_client_service.impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artist_client_service_provider.g.dart';

@Riverpod(keepAlive: true)
ArtistClientService artistClientService(ArtistClientServiceRef ref) {
  return ArtistClientServiceImpl(ref.watch(artistClientRepositoryProvider));
}
