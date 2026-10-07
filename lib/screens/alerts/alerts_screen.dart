import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../widgets/alert_card.dart';
import '../../widgets/campus_bottom_navigation.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({super.key});
  @override
  State<AlertsScreen> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  String filter = 'All';
  static const filters = [
    'All',
    'Critical',
    'Warning',
    'Information',
    'Resolved',
  ];
  @override
  Widget build(BuildContext context) {
    final alerts = filter == 'All'
        ? MockData.alerts
        : MockData.alerts.where((a) => a.severity == filter);
    return Scaffold(
      appBar: AppBar(title: const Text('Campus alerts')),
      bottomNavigationBar: const CampusBottomNavigation(currentIndex: 1),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Stay informed about campus safety',
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 14),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: filters
                  .map(
                    (f) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(f),
                        selected: filter == f,
                        onSelected: (_) => setState(() => filter = f),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const SizedBox(height: 18),
          ...alerts.map((a) => AlertCard(alert: a)),
        ],
      ),
    );
  }
}
