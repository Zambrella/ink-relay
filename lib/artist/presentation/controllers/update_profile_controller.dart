import 'package:ink_relay/artist/domain/artist.dart';
import 'package:ink_relay/artist/providers/artist_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_controller.g.dart';

@riverpod
class UpdateProfileController extends _$UpdateProfileController {
  @override
  Future<Artist> build() async {
    final artist = await ref.watch(artistServiceProvider).getUserArtist();
    return artist;
  }
}
