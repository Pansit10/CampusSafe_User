import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class StatusChip extends StatelessWidget {
  const StatusChip({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    final color = label == 'Resolved'
        ? AppColors.success
        : label == 'Critical' || label == 'Active'
        ? AppColors.danger
        : label == 'Under Review' || label == 'Warning'
        ? AppColors.warning
        : AppColors.blue;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
