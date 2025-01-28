part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class LoadCoursesAndBatches extends RegisterEvent {}

class RegisterStudent extends RegisterEvent {
  final String fname;
  final String lname;
  final String phone;
  final BatchEntity batch;
  final List<CourseEntity> courses;
  final String username;
  final String password;

  const RegisterStudent(
    this.fname,
    this.lname,
    this.phone,
    this.batch,
    this.courses,
    this.username,
    this.password,
  );

  @override
  List<Object> get props => [fname, lname, phone, batch, courses, username, password];
}


