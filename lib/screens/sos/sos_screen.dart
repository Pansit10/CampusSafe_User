import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/primary_button.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: const Color(0xFFFFF5F5),
    appBar: AppBar(backgroundColor: Colors.transparent),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: AppColors.danger,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.danger.withValues(alpha: .25),
                    blurRadius: 30,
                  ),
                ],
              ),
              child: const Center(
                child: Text(
                  'SOS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 44,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Emergency assistance',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'Only use SOS when you or someone nearby is in immediate danger.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            const Card(
              child: ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text('Your location'),
                subtitle: Text('Main Library • 2nd Floor'),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Send SOS alert',
              danger: true,
              icon: Icons.warning_amber,
              onPressed: () async {
                final ok = await showDialog<bool>(
                  context: context,
                  builder: (c) => AlertDialog(
                    title: const Text('Send emergency alert?'),
                    content: const Text(
                      'Campus Security will receive your location and contact details.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(c, false),
                        child: const Text('Cancel'),
                      ),
                      FilledButton(
                        onPressed: () => Navigator.pop(c, true),
                        child: const Text('Send alert'),
                      ),
                    ],
                  ),
                );
                if (ok == true && context.mounted) {
                  Navigator.pushReplacementNamed(context, AppRoutes.sosStatus);
                }
              },
            ),
          ],
        ),
      ),
    ),
  );
}
