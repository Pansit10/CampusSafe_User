import '../models/campus_alert.dart';
import '../models/incident.dart';

abstract final class MockData {
  static const incidents = [
    Incident(
      title: 'Suspicious activity',
      location: 'Main Library',
      time: '10 min ago',
      status: 'Under Review',
    ),
    Incident(
      title: 'Medical emergency',
      location: 'Student Union',
      time: 'Yesterday',
      status: 'Resolved',
    ),
    Incident(
      title: 'Safety escort',
      location: 'North Parking',
      time: '2 days ago',
      status: 'Responding',
    ),
  ];
  static const alerts = [
    CampusAlert(
      title: 'Active Incident',
      location: 'North Campus',
      time: 'Now',
      severity: 'Critical',
      status: 'Active',
    ),
    CampusAlert(
      title: 'Suspicious Activity Reported',
      location: 'Science Hall',
      time: '45 min ago',
      severity: 'Warning',
      status: 'Monitoring',
    ),
    CampusAlert(
      title: 'Campus Safety Patrol',
      location: 'East Residence',
      time: '2 hours ago',
      severity: 'Information',
      status: 'Scheduled',
    ),
    CampusAlert(
      title: 'Medical Emergency Resolved',
      location: 'Student Union',
      time: 'Yesterday',
      severity: 'Resolved',
      status: 'Resolved',
    ),
  ];
}
