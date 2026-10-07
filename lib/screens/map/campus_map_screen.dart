import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../widgets/campus_bottom_navigation.dart';

class CampusMapScreen extends StatelessWidget {
  const CampusMapScreen({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Campus map')),
    bottomNavigationBar: const CampusBottomNavigation(currentIndex: 2),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        const Wrap(
          spacing: 8,
          children: [
            Chip(label: Text('All')),
            Chip(label: Text('Incidents')),
            Chip(label: Text('Responders')),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 300,
          decoration: BoxDecoration(
            color: AppColors.softBlue,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Stack(
            children: [
              CustomPaint(size: Size.infinite, painter: _GridPainter()),
              const Positioned(
                left: 130,
                top: 130,
                child: _Marker(
                  icon: Icons.person_pin_circle,
                  color: AppColors.blue,
                  label: 'You',
                ),
              ),
              const Positioned(
                left: 45,
                top: 55,
                child: _Marker(
                  icon: Icons.warning,
                  color: AppColors.danger,
                  label: 'Incident',
                ),
              ),
              const Positioned(
                right: 45,
                bottom: 55,
                child: _Marker(
                  icon: Icons.security,
                  color: AppColors.success,
                  label: 'Responder',
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Active incidents',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.warning_amber, color: AppColors.danger),
            title: Text('Suspicious activity'),
            subtitle: Text('Main Library • Under review'),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Responders nearby',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Card(
          child: ListTile(
            leading: Icon(Icons.security, color: AppColors.success),
            title: Text('Unit Alpha'),
            subtitle: Text('3 minutes away'),
          ),
        ),
      ],
    ),
  );
}

class _Marker extends StatelessWidget {
  const _Marker({required this.icon, required this.color, required this.label});
  final IconData icon;
  final Color color;
  final String label;
  @override
  Widget build(BuildContext context) => Column(
    children: [
      CircleAvatar(
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
      Text(
        label,
        style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas c, Size s) {
    final p = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;
    for (double x = 0; x < s.width; x += 32) {
      c.drawLine(Offset(x, 0), Offset(x, s.height), p);
    }
    for (double y = 0; y < s.height; y += 32) {
      c.drawLine(Offset(0, y), Offset(s.width, y), p);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
