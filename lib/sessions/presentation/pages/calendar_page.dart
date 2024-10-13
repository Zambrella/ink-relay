import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarPage extends ConsumerStatefulWidget {
  const CalendarPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CalendarPageState();
}

class _CalendarPageState extends ConsumerState<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Event $index'),
                        );
                      },
                    ),
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
