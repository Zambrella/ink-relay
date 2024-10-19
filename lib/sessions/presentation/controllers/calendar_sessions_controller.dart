import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'calendar_sessions_controller.g.dart';

@riverpod
class CalendarSessionsController extends _$CalendarSessionsController {
  @override
  FutureOr<void> build() {
    // TOOD: Fetch upcoming sessions for this month.
    return null;
  }

  Future<void> changeMonth() async {
    // TODO: state = state.copyWithPrevious()...
    // Fetching more...
  }
}
