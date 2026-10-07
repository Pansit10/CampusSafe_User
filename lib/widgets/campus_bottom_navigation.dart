import 'package:flutter/material.dart';
import '../routes/app_routes.dart';

class CampusBottomNavigation extends StatelessWidget {
  const CampusBottomNavigation({super.key, required this.currentIndex});
  final int currentIndex;
  @override
  Widget build(BuildContext context) => NavigationBar(
    selectedIndex: currentIndex,
    onDestinationSelected: (index) {
      final routes = [
        AppRoutes.home,
        AppRoutes.alerts,
        AppRoutes.campusMap,
        AppRoutes.profile,
      ];
      if (index != currentIndex) {
        Navigator.pushReplacementNamed(context, routes[index]);
      }
    },
    destinations: const [
      NavigationDestination(
        icon: Icon(Icons.home_outlined),
        selectedIcon: Icon(Icons.home),
        label: 'Home',
      ),
      NavigationDestination(
        icon: Icon(Icons.notifications_outlined),
        selectedIcon: Icon(Icons.notifications),
        label: 'Alerts',
      ),
      NavigationDestination(
        icon: Icon(Icons.map_outlined),
        selectedIcon: Icon(Icons.map),
        label: 'Map',
      ),
      NavigationDestination(
        icon: Icon(Icons.person_outline),
        selectedIcon: Icon(Icons.person),
        label: 'Profile',
      ),
    ],
  );
}
