import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/pages/boxes.dart';
import 'add_student_page.dart';
import 'notification_setting_page.dart';
import '../models/student.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
 // final List<Student> _students = [];
  @override
  void dispose(){
    Hive.close();
    super.dispose();
  }

  Future<void> addStudent(Student student) async {
    final box = Hive.box<Student>("transactions");
    box.add(student);
  }

  void deleteStudent(Student student) {
    final box = Hive.box<Student>("transactions");
    final index = box.values.toList().indexOf(student);
    if (index != -1) {
      box.deleteAt(index);
      setState(() {
        // Remove the student from any data structures or state variables in your UI.
      });
    }
  }

  void openNotificationSettings(Student student, Box<Student> box) {
    Box<Student> box = Hive.box<Student>('transactions');
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationSettingsPage(student: student, box: box),
      ),
    );
  }










  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: const Text('نظام إدارة السجناء'),

      ),
      body: ValueListenableBuilder<Box<Student>>(
        valueListenable: Boxes.getTransactions().listenable(),
        builder: (context,box,_) {
          final student0 = box.values.toList().cast<Student>();
          return ListView.builder(
            itemCount: student0.length,
            itemBuilder: (context, index) {
              final student = student0[index];

              return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        student.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'السجل المدني-الإقامة / ${student.id}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'الجنسية/ ${student.nationality}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'الجنس/ ${student.gender}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        ' الجهة/ ${student.schoolName}     ',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        ':تاريخ الدخول ${student.admissionDate.toIso8601String()}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'تاريخ الخروج ${student.exitDate.toIso8601String()}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.notification_add_outlined),
                          onPressed: () {
                            openNotificationSettings(student,box);
                          },
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            deleteStudent(student);
                          },
                          child: const Text("حذف السجين"),
                        ),
                      ],
                    ),

                  ],
                ),
              );
            },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddStudentPage(
                addStudent: addStudent,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
