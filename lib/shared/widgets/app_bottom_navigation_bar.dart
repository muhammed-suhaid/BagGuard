import 'package:flutter/material.dart';

import 'package:bagguard/core/constants/app_icons.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onDestinationSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onDestinationSelected,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,

      destinations: const [
        NavigationDestination(
          icon: Icon(AppIcons.navHome1),
          selectedIcon: Icon(AppIcons.navHome2),
          label: 'Dashboard',
        ),
        NavigationDestination(
          icon: Icon(AppIcons.navDevice1),
          selectedIcon: Icon(AppIcons.navDevice2),
          label: 'Devices',
        ),
        NavigationDestination(
          icon: Icon(AppIcons.navSettings1),
          selectedIcon: Icon(AppIcons.navSettings2),
          label: 'Settings',
        ),
      ],
    );
  }
}
