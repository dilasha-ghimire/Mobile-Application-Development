import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

abstract class IAuthRepository {
  Future<Either<Failure, void>> addAuth(AuthEntity entity);
  Future<Either<Failure, void>> deleteAuth(String id);
  Future<Either<Failure, List<AuthEntity>>> getAllAuth();
}
