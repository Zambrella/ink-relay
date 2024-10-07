import 'package:flutter/material.dart';

class ScaffoldWithNavigationBar extends StatelessWidget {
  const ScaffoldWithNavigationBar({
    required this.body,
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final Widget body;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        destinations: const [
          NavigationDestination(
            label: 'Calendar',
            icon: Icon(Icons.calendar_month),
          ),
          NavigationDestination(
            label: 'Messages',
            icon: Icon(Icons.message),
          ),
          NavigationDestination(
            label: 'Projects',
            icon: Icon(Icons.bar_chart),
          ),
          NavigationDestination(
            label: 'Clients',
            icon: Icon(Icons.insert_chart),
          ),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
