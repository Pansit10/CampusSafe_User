import 'package:flutter/material.dart';
import 'routes/app_routes.dart';
import 'theme/app_theme.dart';

class CampusSafeApp extends StatelessWidget {
  const CampusSafeApp({super.key});
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'CampusSafe',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    initialRoute: AppRoutes.splash,
    onGenerateRoute: AppRoutes.onGenerateRoute,
  );
}
