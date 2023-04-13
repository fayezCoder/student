import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'student.g.dart';

@HiveType(typeId: 0)
class Student  extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String gender;
  @HiveField(2)
  String id;
  @HiveField(3)
  String nationality;
  @HiveField(4)
  String schoolName;
  @HiveField(5)
  DateTime admissionDate;
  @HiveField(6)
  DateTime exitDate;
  @HiveField(7)
  bool isNotificationEnabled;
  @HiveField(8)
  int daysBeforeExit;

  Student({
    required this.name,
    required this.gender,
    required this.id,
    required this.nationality,
    required this.schoolName,
    required this.admissionDate,
    required this.exitDate,
    this.isNotificationEnabled = false,
    this.daysBeforeExit = 1,
  });

}
