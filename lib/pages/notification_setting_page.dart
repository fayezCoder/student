import 'package:flutter/material.dart';
import '../models/student.dart';

class NotificationSettingsPage extends StatefulWidget {
  final Student student;

  const NotificationSettingsPage({Key? key, required this.student}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _isNotificationEnabled = false;
  int _daysBeforeExit = 1;

  @override
  void initState() {
    super.initState();
    // Initialize the notification settings based on the student's data
    _isNotificationEnabled = widget.student.isNotificationEnabled;
    _daysBeforeExit = widget.student.daysBeforeExit;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Enable Notification'),
            Switch(
              value: _isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text('Days Before Exit'),
            Slider(
              value: _daysBeforeExit.toDouble(),
              min: 1.0,
              max: 30.0,
              divisions: 29,
              onChanged: (value) {
                setState(() {
                  _daysBeforeExit = value.round();
                });
              },
              label: _daysBeforeExit.toString(),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Update the student's notification settings
                  widget.student.isNotificationEnabled = _isNotificationEnabled;
                  widget.student.daysBeforeExit = _daysBeforeExit;
                  Navigator.pop(context);
                },
                child: const Text('Save Settings'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
