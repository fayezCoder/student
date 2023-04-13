import 'package:flutter/material.dart';
import 'notification_setting_page.dart';
import '../models/student.dart';

class StudentNotificationSettingsPage extends StatefulWidget {
  final List<Student> students;

  const StudentNotificationSettingsPage({Key? key, required this.students}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _StudentNotificationSettingsPageState createState() => _StudentNotificationSettingsPageState();
}

class _StudentNotificationSettingsPageState extends State<StudentNotificationSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Notification Settings'),
      ),
      body: ListView.builder(
        itemCount: widget.students.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(widget.students[index].name),
              subtitle: Text(widget.students[index].id),
              trailing: IconButton(
                icon: const Icon(Icons.alarm_add),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationSettingsPage(student: widget.students[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
