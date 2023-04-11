// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 0;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      name: fields[0] as String,
      gender: fields[1] as String,
      id: fields[2] as String,
      nationality: fields[3] as String,
      schoolName: fields[4] as String,
      admissionDate: fields[5] as DateTime,
      exitDate: fields[6] as DateTime,
      isNotificationEnabled: fields[7] as bool,
      daysBeforeExit: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.nationality)
      ..writeByte(4)
      ..write(obj.schoolName)
      ..writeByte(5)
      ..write(obj.admissionDate)
      ..writeByte(6)
      ..write(obj.exitDate)
      ..writeByte(7)
      ..write(obj.isNotificationEnabled)
      ..writeByte(8)
      ..write(obj.daysBeforeExit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
