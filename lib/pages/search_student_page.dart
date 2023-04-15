import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/student.dart';
import 'boxes.dart';


class SearchStudentPage extends StatefulWidget {
  const SearchStudentPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchStudentPageState createState() => _SearchStudentPageState();
}

class _SearchStudentPageState extends State<SearchStudentPage> {
  final _searchController = TextEditingController();
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent,
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: "ابحث عن سجين",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() {
              searchQuery = value;
            });
          },
        ),
      ),
      body: ValueListenableBuilder<Box<Student>>(
        valueListenable: Boxes.getTransactions().listenable(),
        builder: (context, box, _) {
          final student0 = box.values.toList().cast<Student>();
          final filteredStudents = student0
              .where((student) => student.name.contains(searchQuery))
              .toList();
          return ListView.builder(
            itemCount: filteredStudents.length,
            itemBuilder: (context, index) {
              final student = filteredStudents[index];
              return Card(
                child: ListTile(
                  title: Text(student.name),
                  subtitle: Text(student.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
