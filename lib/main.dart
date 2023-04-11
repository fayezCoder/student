import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:students/pages/home_page.dart';

import 'models/student_model.dart';

void main()  async{
  await Hive.initFlutter();

  await Hive.openBox('myBox');
  Hive.registerAdapter(StudentModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student ',
      theme: ThemeData.fallback(),
      home: const HomePage(),
    );
  }
}
