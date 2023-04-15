import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:students/pages/home_page.dart';
import 'package:students/models/student.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Hive
  await Hive.initFlutter();
  // Register adapter for the student model
  Hive.registerAdapter(StudentAdapter());
  // Open the Hive box for students
  await Hive.openBox<Student>("transactions");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student ',
      theme: ThemeData(cardColor: Colors.yellowAccent,

      ),
      home: const HomePage(),
    );
  }
}
