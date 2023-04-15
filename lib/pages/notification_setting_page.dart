import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/student.dart';

class NotificationSettingsPage extends StatefulWidget {
  final Student student;
  final Box<Student> box;

  const NotificationSettingsPage({Key? key, required this.student, required this.box}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _isNotificationEnabled = true;
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
        title: const Text('صفحة التنبيهات والإشعارات'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('تفعيل التنبيه'),
            Switch(
              value: _isNotificationEnabled,
              onChanged: (value) {
                setState(() {
                  _isNotificationEnabled = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            const Text('اختر مدة التنبيه للخروج بالايام'),
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
                  // Save the data to the box
                  final newStudent = Student(
                    name: widget.student.name,
                    id: widget.student.id,
                    gender: widget.student.gender,
                    nationality: widget.student.nationality,
                    schoolName: widget.student.schoolName,
                    admissionDate: widget.student.admissionDate,
                    exitDate: widget.student.exitDate,
                    isNotificationEnabled: _isNotificationEnabled,
                    daysBeforeExit: _daysBeforeExit,
                  );
                  widget.box.put(widget.student.key, newStudent);

                  // Navigate back to the previous screen
                  Navigator.pop(context);
                },
                child: const Text('حفظ الإعدادات'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
