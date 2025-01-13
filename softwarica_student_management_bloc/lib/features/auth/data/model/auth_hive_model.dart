import 'package:equatable/equatable.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:softwarica_student_management_bloc/app/constants/hive_table_constant.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/model/batch_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/course/data/model/course_hive_model.dart';
import 'package:uuid/uuid.dart';

part 'auth_hive_model.g.dart';

@HiveType(typeId: HiveTableConstant.authTableId)
class AuthHiveModel extends Equatable {
  @HiveField(0)
  final String? studentId;
  @HiveField(1)
  final String fname;
  @HiveField(2)
  final String lname;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final BatchHiveModel batch;
  @HiveField(6)
  final List<CourseHiveModel> courses;
  @HiveField(7)
  final String username;
  @HiveField(8)
  final String password;

  AuthHiveModel({
    String? studentId,
    required this.fname,
    required this.lname,
    this.image,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  }) : studentId = studentId ?? Uuid().v4();

  const AuthHiveModel.initial()
      : studentId = "",
        fname = "",
        lname = "",
        image = "",
        batch = const BatchHiveModel.initial(),
        courses = const [],
        username = "",
        password = "";

  factory AuthHiveModel.fromEntity(AuthEntity entity) {
    return AuthHiveModel(
      studentId: entity.studentId,
      fname: entity.fname,
      lname: entity.lname,
      batch: BatchHiveModel.fromEntity(entity.batch),
      courses: entity.courses
          .map((course) => CourseHiveModel.fromEntity(course))
          .toList(),
      username: entity.username,
      password: entity.password,
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      studentId: studentId,
      fname: fname,
      lname: lname,
      image: image,
      batch: batch.toEntity(),
      courses: courses.map((course) => course.toEntity()).toList(),
      username: username,
      password: password,
    );
  }

  @override
  List<Object?> get props => [
        studentId,
        fname,
        lname,
        image,
        batch,
        courses,
        username,
        password,
      ];
}
