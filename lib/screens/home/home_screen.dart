import 'package:flutter/material.dart';
import '../../data/mock_data.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/campus_app_bar.dart';
import '../../widgets/campus_bottom_navigation.dart';
import '../../widgets/feature_card.dart';
import '../../widgets/incident_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const CampusAppBar(showActions: true),
    bottomNavigationBar: const CampusBottomNavigation(currentIndex: 0),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          'Welcome back, Student',
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        const Text(
          'How can we help you today?',
          style: TextStyle(color: AppColors.muted),
        ),
        const SizedBox(height: 18),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          decoration: BoxDecoration(
            color: AppColors.softBlue,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.verified_user_outlined,
                color: AppColors.blue,
                size: 22,
              ),
              SizedBox(width: 11),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Campus safety is connected',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: AppColors.text,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Security services are available 24/7',
                      style: TextStyle(fontSize: 12, color: AppColors.muted),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 18),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1.06,
          children: [
            FeatureCard(
              title: 'Report incident',
              subtitle: 'Submit a detailed report',
              icon: Icons.report_outlined,
              color: AppColors.blue,
              onTap: () =>
                  Navigator.pushNamed(context, AppRoutes.reportIncident),
            ),
            FeatureCard(
              title: 'SOS / Get help',
              subtitle: 'Request urgent assistance',
              icon: Icons.sos,
              color: AppColors.danger,
              onTap: () => Navigator.pushNamed(context, AppRoutes.sos),
            ),
            FeatureCard(
              title: 'View alerts',
              subtitle: 'Recent campus updates',
              icon: Icons.notifications_active_outlined,
              color: AppColors.warning,
              onTap: () => Navigator.pushNamed(context, AppRoutes.alerts),
            ),
            FeatureCard(
              title: 'Campus map',
              subtitle: 'Incidents and responders',
              icon: Icons.map_outlined,
              color: AppColors.success,
              onTap: () => Navigator.pushNamed(context, AppRoutes.campusMap),
            ),
          ],
        ),
        const SizedBox(height: 26),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Recent reports',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, AppRoutes.alerts),
              child: const Text('View all'),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ...MockData.incidents.map((i) => IncidentCard(incident: i)),
      ],
    ),
  );
}
