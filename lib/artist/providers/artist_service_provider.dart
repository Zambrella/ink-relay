import 'package:ink_relay/artist/domain/artist_service.abs.dart';
import 'package:ink_relay/artist/providers/artist_repository_provider.dart';
import 'package:ink_relay/artist/service/artist_service.impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'artist_service_provider.g.dart';

@Riverpod(keepAlive: true)
ArtistService artistService(ArtistServiceRef ref) {
  return ArtistServiceImpl(ref.watch(artistRepositoryProvider));
}
