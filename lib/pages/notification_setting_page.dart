import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/student.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


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
  late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;


//////////////////////////
  Future<void> _initializeFlutterLocalNotificationsPlugin() async {
    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    const initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    const initializationSettingsIOS = IOSInitializationSettings();
    const initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
  ///////////////////////
  Future<void> _scheduleNotification() async {
    const androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      'channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    const platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    final scheduledDate = widget.student.exitDate.subtract(Duration(days: _daysBeforeExit));
    await _flutterLocalNotificationsPlugin.schedule(
      widget.student.id.hashCode,
      'موعد خروج ${widget.student.name}',
      'يتبقى $_daysBeforeExit يوم/أيام فقط حتى موعد خروج ${widget.student.name}',
      scheduledDate,
      platformChannelSpecifics,
    );
  }

  @override
  void initState() {
    super.initState();
    _initializeFlutterLocalNotificationsPlugin();
    // Initialize the notification settings based on the student's data
    _isNotificationEnabled = widget.student.isNotificationEnabled;
    _daysBeforeExit = widget.student.daysBeforeExit;
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(textDirection: TextDirection.rtl,
        child: Scaffold(
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
                    onPressed: () async {
                      if (_isNotificationEnabled) {
                        await _scheduleNotification();
                      }
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
        ));
  }
}
