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

   Future addStudent(student, ) async {
    final box = Boxes.getTransactions();
    //this was the problem for 3 days (student)
    box.add(student);
    }


  void deleteStudent(Student student) {


  }

  void openNotificationSettings(Student student) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationSettingsPage(student: student),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Management System'),

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
                        'ID: ${student.id}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Nationality: ${student.nationality}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Gender: ${student.gender}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'School: ${student.schoolName}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Admission Date: ${student.admissionDate.toIso8601String()}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'Exit Date: ${student.exitDate.toIso8601String()}',
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
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            openNotificationSettings(student);
                          },
                        ),
                        const SizedBox(width: 16.0),
                        ElevatedButton(
                          onPressed: () {
                            deleteStudent(student);
                          },
                          child: const Text("Delete Student"),
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
