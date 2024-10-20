import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ink_relay/artist/providers/user_artist_provider.dart';
import 'package:ink_relay/clients/domain/contact.dart';
import 'package:ink_relay/common/models.dart';
import 'package:ink_relay/sessions/domain/tattoo_session.dart';
import 'package:ink_relay/sessions/presentation/controllers/create_new_session_controller.dart';
import 'package:ink_relay/sessions/presentation/controllers/upcoming_sessions_controller.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(createNewSessionControllerProvider, (prev, state) {
      print(state);
    });

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final artistId = ref.read(userArtistIdProvider).id;
          final contact = Contact(
            id: Identifier.newId(),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            name: 'Test Name',
            artistId: Identifier(artistId),
            inquiredAt: DateTime.now(),
          );
          final newSession = TattooSession(
            id: Identifier.newId(),
            createdAt: DateTime.now(),
            updatedAt: DateTime.now(),
            when: DateTime.now(),
            duration: const Duration(hours: 2),
            status: 'scheduled',
            artistId: Identifier(artistId),
            contact: contact,
          );
          ref
              .read(createNewSessionControllerProvider.notifier)
              .createNewTattooSession(newSession);
        },
        child: Icon(Icons.add),
      ),
      body: Row(
        children: [
          Expanded(
            child: MonthView(),
          ),
          SizedBox(
            width: 300,
            child: Center(
              child: Column(
                children: [
                  Text('Events'),
                  Expanded(
                    child: switch (
                        ref.watch(upcomingSessionsControllerProvider)) {
                      AsyncData(valueOrNull: final sessions?) =>
                        ListView.builder(
                          itemCount: sessions.length,
                          itemBuilder: (context, index) {
                            final session = sessions[index];
                            return ListTile(
                              title: Text(session.contact.name),
                              subtitle: Text(session.when.toString()),
                            );
                          },
                        ),
                      AsyncError(:final error) => Text('Error: $error'),
                      _ => const Center(
                          child: CircularProgressIndicator(),
                        ),
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
