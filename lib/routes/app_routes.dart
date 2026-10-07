import 'package:flutter/material.dart';
import '../screens/alerts/alerts_screen.dart';
import '../screens/auth/login_screen.dart';
import '../screens/auth/register_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/incidents/report_incident_screen.dart';
import '../screens/map/campus_map_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/sos/sos_screen.dart';
import '../screens/sos/sos_status_screen.dart';
import '../screens/splash/splash_screen.dart';

abstract final class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const reportIncident = '/report-incident';
  static const sos = '/sos';
  static const sosStatus = '/sos-status';
  static const alerts = '/alerts';
  static const campusMap = '/campus-map';
  static const profile = '/profile';
  static Route<void> onGenerateRoute(RouteSettings settings) {
    final pages = <String, WidgetBuilder>{
      splash: (_) => const SplashScreen(),
      login: (_) => const LoginScreen(),
      register: (_) => const RegisterScreen(),
      home: (_) => const HomeScreen(),
      reportIncident: (_) => const ReportIncidentScreen(),
      sos: (_) => const SosScreen(),
      sosStatus: (_) => const SosStatusScreen(),
      alerts: (_) => const AlertsScreen(),
      campusMap: (_) => const CampusMapScreen(),
      profile: (_) => const ProfileScreen(),
    };
    return MaterialPageRoute(
      builder: pages[settings.name] ?? (_) => const LoginScreen(),
      settings: settings,
    );
  }
}
