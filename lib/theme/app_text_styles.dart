import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract final class AppTextStyles {
  static const display = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w800,
    color: AppColors.text,
    letterSpacing: -.7,
  );
  static const title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );
  static const subtitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );
  static const caption = TextStyle(
    fontSize: 12,
    color: AppColors.muted,
    height: 1.35,
  );
}
