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
  final String phone;
  final BatchEntity batch;
  final List<CourseEntity> courses;
  final String username;
  final String password;

  const CreateAuthParams({
    required this.fname,
    required this.lname,
    required this.phone,
    required this.batch,
    required this.courses,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [fname, lname, phone, batch, courses, username, password];
}

class CreateAuthUsecase implements UsecaseWithParams<void, CreateAuthParams> {
  final IAuthRepository authRepository;

  CreateAuthUsecase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(CreateAuthParams params) async{
    return await authRepository.createAuth(
      AuthEntity(
        fname: params.fname, 
        lname: params.lname, 
        phone: params.phone, 
        batch: params.batch,
        courses: params.courses,
        username: params.username, 
        password: params.password
      )
    );
  }
}
