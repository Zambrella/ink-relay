import 'package:flutter/material.dart';
import 'package:ink_relay/theme/form_factor.dart';

class ScaffoldWithNavigationRail extends StatelessWidget {
  const ScaffoldWithNavigationRail({
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
    final formFactor = FormFactorWidget.of(context);
    return Scaffold(
      body: Row(
        children: [
          // Fixed navigation rail on the left (start)
          NavigationRail(
            selectedIndex: selectedIndex,
            onDestinationSelected: onDestinationSelected,
            extended: formFactor == FormFactor.desktop,
            labelType: formFactor == FormFactor.desktop
                ? NavigationRailLabelType.none
                : NavigationRailLabelType.all,
            destinations: const [
              NavigationRailDestination(
                label: Text('Calendar'),
                icon: Icon(Icons.calendar_month),
              ),
              NavigationRailDestination(
                label: Text('Messages'),
                icon: Icon(Icons.message),
              ),
              NavigationRailDestination(
                label: Text('Projects'),
                icon: Icon(Icons.bar_chart),
              ),
              NavigationRailDestination(
                label: Text('Clients'),
                icon: Icon(Icons.insert_chart),
              ),
            ],
          ),
          const VerticalDivider(thickness: 1, width: 1),
          // Main content on the right (end)
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}
