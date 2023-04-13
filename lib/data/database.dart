import 'package:hive_flutter/hive_flutter.dart';

import '../models/student.dart';

class StudentDataBase{

   List<Student> students = [];

  final _myBox = Hive.box('mybox');

  void createInitialData(){

  }
  void loadData(){
    students = _myBox.get("jj");
  }

  void updateDataBase(){
    _myBox.put("jj", students);
  }



}