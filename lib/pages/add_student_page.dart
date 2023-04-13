import 'package:flutter/material.dart';
import '../models/student.dart';

class AddStudentPage extends StatefulWidget {
 final Function(Student) addStudent;
 const AddStudentPage({Key? key, required this.addStudent}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddStudentPageState createState() => _AddStudentPageState();
}
class _AddStudentPageState extends State<AddStudentPage> {

  final _formKey = GlobalKey<FormState>();
  String? _name;
  String? _gender;
  String? _id;
  String? _nationality;
  String? _school;
  DateTime? _admissionDate;
  DateTime? _exitDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(' أضف سجين'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الإسم',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'قم بإضافة سجين';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'رقم السجل المدني/ الإقامة',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'قم بإضافه السجل المدني أو الإقامة';
                  }
                  return null;
                },
                onSaved: (value) {
                  _id = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الجنسية',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'قم بإضافة الجنسية';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nationality = value;
                },
              ),

              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الجنس:',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'قم بإضافة الجنس ';
                  }
                  return null;
                },
                onSaved: (value) {
                  _gender = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'الجهة',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'قم بإضافة الجهة';
                  }
                  return null;
                },
                onSaved: (value) {
                  _school = value;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101),
                  );
                  if (pickedDate != null) {
                    // ignore: use_build_context_synchronously
                    final TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (pickedTime != null) {
                      setState(() {
                        _admissionDate = DateTime(
                          pickedDate.year,
                          pickedDate.month,
                          pickedDate.day,
                          pickedTime.hour,
                          pickedTime.minute,
                        );
                      });
                    }
                  }
                },
                child: const Text('التاريخ/ الوقت لدخول السجين'),
              ),
              if (_admissionDate != null)
                Text(':تاريخ ووقت الدخول ${_admissionDate.toString()}'),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2015, 8),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      // ignore: use_build_context_synchronously
                      final TimeOfDay? pickedTime = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          _exitDate = DateTime(
                            pickedDate.year,
                            pickedDate.month,
                            pickedDate.day,
                            pickedTime.hour,
                            pickedTime.minute,
                          );
                        });
                      }
                    }
                  },
                  child: const Text('التاريخ/ الوقت لخروج السجين'),
              ),
              if (_exitDate != null)
                Text('التاريخ/ الوقت لخروج السجين: ${_exitDate!.toIso8601String()}'),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Student newStudent = Student(
                        name: _name!,
                        id: _id!,
                        nationality: _nationality!,
                        gender:_gender!,
                        schoolName: _school!,
                        admissionDate: _admissionDate!,
                        exitDate: _exitDate!,
                      );
                      widget.addStudent(newStudent);
                      Navigator.pop(context); // navigate back to the previous screen
                    }
                  },
                  child: const Text('حفظ'),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
