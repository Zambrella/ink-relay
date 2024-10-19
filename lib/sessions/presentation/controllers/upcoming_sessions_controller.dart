import 'package:ink_relay/artist/providers/user_artist_provider.dart';
import 'package:ink_relay/sessions/domain/tattoo_session.dart';
import 'package:ink_relay/sessions/providers/tattoo_session_service_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'upcoming_sessions_controller.g.dart';

@riverpod
class UpcomingSessionsController extends _$UpcomingSessionsController {
  @override
  FutureOr<List<TattooSession>> build() async {
    final artistId = (await ref.read(userArtistProvider.future)).id.toString();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final sevenDaysFromNow = today.add(const Duration(days: 7));
    final sessions =
        await ref.read(tattooSessionServiceProvider).getTattooSessions(
              artistId,
              start: today,
              end: sevenDaysFromNow,
            );
    return sessions;
  }

  Future<void> fetchMore() async {
    // TODO: state = state.copyWithPrevious()...
    // Fetching more...
  }
}
