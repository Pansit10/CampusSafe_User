import 'package:flutter/material.dart';
import '../../widgets/campus_app_bar.dart';
import '../../widgets/campus_bottom_navigation.dart';
import '../../widgets/primary_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Profile')),
    bottomNavigationBar: const CampusBottomNavigation(currentIndex: 3),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const CircleAvatar(radius: 54, child: Icon(Icons.person, size: 62)),
        const SizedBox(height: 14),
        const Center(
          child: Text(
            'Juan Dela Cruz',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        const Center(child: Text('Student')),
        Center(
          child: TextButton.icon(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Edit profile placeholder')),
            ),
            icon: const Icon(Icons.edit_outlined),
            label: const Text('Edit profile'),
          ),
        ),
        const SizedBox(height: 12),
        const _InfoCard(
          title: 'Contact information',
          items: [('Email', 'juan@university.edu'), ('Phone', '0912 345 6789')],
        ),
        const _InfoCard(
          title: 'Emergency contact',
          items: [
            ('Maria Dela Cruz', '0917 555 0142'),
            ('Relationship', 'Parent'),
          ],
        ),
        const _InfoCard(
          title: 'Recent SOS status',
          items: [
            ('Last alert', 'No active emergency'),
            ('Responder', 'Not required'),
          ],
        ),
        const SizedBox(height: 14),
        PrimaryButton(
          label: 'Log out',
          onPressed: () => CampusAppBar.showLogout(context),
        ),
      ],
    ),
  );
}

class _InfoCard extends StatelessWidget {
  const _InfoCard({required this.title, required this.items});
  final String title;
  final List<(String, String)> items;
  @override
  Widget build(BuildContext context) => Card(
    margin: const EdgeInsets.only(bottom: 12),
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          const Divider(),
          ...items.map(
            (i) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      i.$1,
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ),
                  Text(i.$2),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
