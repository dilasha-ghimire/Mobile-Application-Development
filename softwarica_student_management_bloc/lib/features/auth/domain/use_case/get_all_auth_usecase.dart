import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class GetAllAuthUsecase implements UsecaseWithoutParams<List<AuthEntity>> {
  final IAuthRepository authRepository;
  GetAllAuthUsecase({required this.authRepository});

  @override
  Future<Either<Failure, List<AuthEntity>>> call() {
    return authRepository.getAllAuth();
  }
}