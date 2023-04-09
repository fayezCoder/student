import 'package:flutter/material.dart';
import 'student.dart';

class AddStudentPage extends StatefulWidget {

  //This is a function for creating a student object
  final Function(Student) addStudent;
  const AddStudentPage({Key? key, required this.addStudent}) : super(key: key);

  @override
  _AddStudentPageState createState() => _AddStudentPageState();
}

class _AddStudentPageState extends State<AddStudentPage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _id;
  String? _nationality;
  String? _school;
  DateTime? _admissionDate;
  DateTime? _exitDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'ID No',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an ID No';
                  }
                  return null;
                },
                onSaved: (value) {
                  _id = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Nationality',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a nationality';
                  }
                  return null;
                },
                onSaved: (value) {
                  _nationality = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'School Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a school name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _school = value;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      _admissionDate = picked;
                    });
                  }
                },
                child: const Text('Admission Date'),
              ),
              if (_admissionDate != null)
                Text('Admission Date: ${_admissionDate!.toIso8601String()}'),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      _exitDate = picked;
                    });
                  }
                },
                child: const Text('Exit Date'),
              ),
              if (_exitDate != null)
                Text('Exit Date: ${_exitDate!.toIso8601String()}'),
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
                        schoolName: _school!,
                        admissionDate: _admissionDate!,
                        exitDate: _exitDate!,
                      );
                      widget.addStudent(newStudent);
                      Navigator.pop(context); // navigate back to the previous screen
                    }
                  },
                  child: const Text('Submit'),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
