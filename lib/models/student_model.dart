import 'package:hive/hive.dart';

part 'student_model.g.dart';
@HiveType(typeId: 0)
class StudentModel extends HiveObject {

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String gender;
  @HiveField(2)
  final String id;
  @HiveField(3)
  final String nationality;
  @HiveField(4)
  final String schoolName;
  @HiveField(5)
  final DateTime admissionDate;
  @HiveField(6)
  final DateTime exitDate;
  @HiveField(7)
  final bool isNotificationEnabled;
  @HiveField(8)
  final int daysBeforeExit;

  StudentModel({
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