import 'package:flutter/material.dart';
import '../routes/app_routes.dart';
import '../theme/app_colors.dart';

class CampusAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CampusAppBar({
    super.key,
    this.title = 'CampusSafe',
    this.showActions = false,
  });
  final String title;
  final bool showActions;
  static Future<void> showLogout(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Log out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );
    if (confirmed == true && context.mounted) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) => AppBar(
    title: Row(
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(
            color: AppColors.softBlue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.shield_outlined,
            size: 21,
            color: AppColors.blue,
          ),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: -.2,
          ),
        ),
      ],
    ),
    actions: showActions
        ? [
            IconButton(
              tooltip: 'Alerts',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.alerts),
              icon: const Icon(Icons.notifications_none),
            ),
            IconButton(
              tooltip: 'Profile',
              onPressed: () => Navigator.pushNamed(context, AppRoutes.profile),
              icon: const Icon(Icons.person_outline),
            ),
            IconButton(
              tooltip: 'Log out',
              onPressed: () => showLogout(context),
              icon: const Icon(Icons.logout),
            ),
          ]
        : null,
  );
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
