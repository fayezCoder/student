import 'package:hive/hive.dart';
import 'package:students/models/student.dart';

class Boxes {
  static Box<Student> getTransactions() =>
      Hive.box<Student>('transactions');



}