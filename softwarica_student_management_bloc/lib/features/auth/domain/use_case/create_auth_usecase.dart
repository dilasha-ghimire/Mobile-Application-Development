import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/entity/course_entity.dart';

class CreateAuthParams extends Equatable {
  final String fname;
  final String lname;
  final String image;
  final String username;
  final String password;
  final BatchEntity batch;
  final List<CourseEntity> courses;

  const CreateAuthParams({
    required this.fname,
    required this.lname,
    required this.image,
    required this.username,
    required this.password,
    required this.batch,
    required this.courses,
  });

  @override
  List<Object?> get props =>
      [fname, lname, image, username, password, batch, courses];
}

class CreateAuthUseCase implements UsecaseWithParams<void, CreateAuthParams> {
  final IAuthRepository repository;

  CreateAuthUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(CreateAuthParams params) {
    var authEntity = AuthEntity(
      fname: params.fname,
      lname: params.lname,
      image: params.image,
      username: params.username,
      password: params.password,
      batch: params.batch,
      courses: params.courses,
    );
    return repository.addAuth(authEntity);
  }
}
