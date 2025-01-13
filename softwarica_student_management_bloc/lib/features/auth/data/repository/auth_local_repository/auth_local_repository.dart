import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/local_datasource/auth_local_datasource.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, void>> addAuth(AuthEntity entity) async {
    try {
      await _authLocalDataSource.createAuth(entity);
      return Right(null);
    } catch (e) {
      return Left(
        LocalDatabaseFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteAuth(String id) async {
    try {
      await _authLocalDataSource.deleteAuth(id);
      return Right(null);
    } catch (e) {
      return Left(
        LocalDatabaseFailure(message: e.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, List<AuthEntity>>> getAllAuth() async {
    try {
      var auth = await _authLocalDataSource.getAllAuth();
      return Right(auth);
    } catch (e) {
      return Left(
        LocalDatabaseFailure(message: e.toString()),
      );
    }
  }
}
