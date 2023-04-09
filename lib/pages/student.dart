class Student {
  String name;
  String gender;
  String id;
  String nationality;
  String schoolName;
  DateTime admissionDate;
  DateTime exitDate;
  bool isNotificationEnabled;
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
