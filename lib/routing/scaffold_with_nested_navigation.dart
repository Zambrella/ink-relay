import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ink_relay/routing/scaffold_with_nav_bar.dart';
import 'package:ink_relay/routing/scaffold_with_nav_rail.dart';
import 'package:ink_relay/theme/form_factor.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  const ScaffoldWithNestedNavigation({
    required this.navigationShell,
    Key? key,
  }) : super(
          key: key ?? const ValueKey<String>('ScaffoldWithNestedNavigation'),
        );

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final formFactor = FormFactorWidget.of(context);
    if (formFactor.isLarge) {
      return ScaffoldWithNavigationRail(
        body: navigationShell,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    } else {
      return ScaffoldWithNavigationBar(
        body: navigationShell,
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
      );
    }
  }
}
