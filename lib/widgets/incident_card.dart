import 'package:flutter/material.dart';
import '../models/incident.dart';
import '../theme/app_colors.dart';
import 'status_chip.dart';

class IncidentCard extends StatelessWidget {
  const IncidentCard({super.key, required this.incident});
  final Incident incident;
  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 10),
    child: ListTile(
      leading: const CircleAvatar(
        backgroundColor: AppColors.softBlue,
        child: Icon(Icons.shield_outlined, color: AppColors.blue),
      ),
      title: Text(
        incident.title,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      subtitle: Text('${incident.location} • ${incident.time}'),
      trailing: StatusChip(label: incident.status),
    ),
  );
}
