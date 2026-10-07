import 'package:flutter/material.dart';
import '../../widgets/app_text_field.dart';
import '../../widgets/primary_button.dart';

class ReportIncidentScreen extends StatefulWidget {
  const ReportIncidentScreen({super.key});
  @override
  State<ReportIncidentScreen> createState() => _ReportIncidentScreenState();
}

class _ReportIncidentScreenState extends State<ReportIncidentScreen> {
  String category = 'Suspicious Activity';
  static const categories = [
    'Suspicious Activity',
    'Theft',
    'Vandalism',
    'Medical Emergency',
    'Fire Hazard',
    'Harassment',
    'Safety Concern',
    'Other',
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Report incident')),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text('Current location'),
            subtitle: const Text('Main Library • 2nd Floor'),
            trailing: TextButton(
              onPressed: () => ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('Location updated'))),
              child: const Text('Update'),
            ),
          ),
        ),
        const SizedBox(height: 18),
        const Text(
          'Incident category',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: categories
              .map(
                (c) => ChoiceChip(
                  label: Text(c),
                  selected: category == c,
                  onSelected: (_) => setState(() => category = c),
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 20),
        const AppTextField(
          label: 'Description',
          hint: 'Provide detailed information about the incident',
          maxLines: 5,
        ),
        const SizedBox(height: 18),
        Card(
          child: InkWell(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Photo picker placeholder')),
            ),
            child: const Padding(
              padding: EdgeInsets.all(28),
              child: Column(
                children: [
                  Icon(Icons.add_a_photo_outlined),
                  SizedBox(height: 8),
                  Text('Upload photo (optional)'),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        PrimaryButton(
          label: 'Submit report',
          onPressed: () => showDialog(
            context: context,
            builder: (c) => AlertDialog(
              title: const Text('Report submitted'),
              content: const Text('Campus Security has received your report.'),
              actions: [
                FilledButton(
                  onPressed: () => Navigator.pop(c),
                  child: const Text('Done'),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
