import 'package:flutter/material.dart';
import '../models/campus_alert.dart';
import '../theme/app_colors.dart';
import 'status_chip.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({super.key, required this.alert});
  final CampusAlert alert;
  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: alert.severity == 'Critical'
                  ? const Color(0xFFFFE8E8)
                  : AppColors.softBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.notifications_active_outlined,
              color: alert.severity == 'Critical'
                  ? AppColors.danger
                  : AppColors.blue,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  alert.title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 7),
                Text(
                  '${alert.location} • ${alert.time}',
                  style: const TextStyle(color: AppColors.muted, fontSize: 12),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 7,
                  children: [
                    StatusChip(label: alert.severity),
                    StatusChip(label: alert.status),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
