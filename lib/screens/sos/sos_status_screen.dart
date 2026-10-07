import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/primary_button.dart';

class SosStatusScreen extends StatelessWidget {
  const SosStatusScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Connected to Campus Security'),
      backgroundColor: AppColors.success,
      foregroundColor: Colors.white,
    ),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Card(
          child: ListTile(
            leading: Icon(Icons.location_on_outlined),
            title: Text('Current location'),
            subtitle: Text('Main Library • 2nd Floor'),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Communication options',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: FilledButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.call),
                label: const Text('Call'),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat_outlined),
                label: const Text('Chat'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 22),
        const Text(
          'Status updates',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        ...[
          'Alert Sent|Just now',
          'Security Notified|A few seconds ago',
          'Responder En Route|ETA 3 minutes',
        ].map((s) {
          final p = s.split('|');
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
              backgroundColor: AppColors.softBlue,
              child: Icon(Icons.check, color: AppColors.success),
            ),
            title: Text(p[0]),
            subtitle: Text(p[1]),
          );
        }),
        const SizedBox(height: 20),
        PrimaryButton(
          label: 'Back to home',
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
            context,
            AppRoutes.home,
            (_) => false,
          ),
        ),
      ],
    ),
  );
}
