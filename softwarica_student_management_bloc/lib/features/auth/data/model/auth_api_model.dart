import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/model/batch_api_model.dart';
import 'package:softwarica_student_management_bloc/features/course/data/model/course_api_model.dart';

part 'auth_api_model.g.dart';

@JsonSerializable()
class AuthApiModel extends Equatable {
  @JsonKey(name: "_id")
  final String? id;
  final String fname;
  final String lname;
  final String phone;
  final BatchApiModel batch;
  final List<CourseApiModel> course;
  final String username;
  final String? password;

  const AuthApiModel({
    this.id,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.batch,
    required this.course, 
    required this.username,
    required this.password
  });

  //fromJson and toJson automatically created using g.dart file
  factory AuthApiModel.fromJson(Map<String, dynamic> json) =>
    _$AuthApiModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthApiModelToJson(this);

  factory AuthApiModel.fromEntity(AuthEntity entity) {
    return AuthApiModel(
      fname: entity.fname, 
      lname: entity.lname,
      phone: entity.phone, 
      batch: BatchApiModel.fromEntity(entity.batch),
      course: entity.courses
          .map((e) => CourseApiModel.fromEntity(e)) 
          .toList(),
      username: entity.username, 
      password: entity.password
    );
  }

  AuthEntity toEntity() {
    return AuthEntity(
      fname: fname, 
      lname: lname, 
      phone: phone, 
      batch: batch.toEntity(), 
      courses: course.map((e) => e.toEntity()).toList(), 
      username: username, 
      password: password ?? ""
    );
  }

  @override
  List<Object?> get props => [id, fname, lname, phone, batch, course, username, password];
}