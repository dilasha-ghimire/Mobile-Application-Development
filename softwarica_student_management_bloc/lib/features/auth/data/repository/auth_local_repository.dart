import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/local_datasource/auth_local_data_source.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;
  AuthLocalRepository({required AuthLocalDataSource authLocalDataSource})
      : _authLocalDataSource = authLocalDataSource;

  @override
  Future<Either<Failure, void>> createAuth(AuthEntity authEntity) {
    try {
      _authLocalDataSource.createAuth(authEntity);
      return Future.value(Right(null));
    } catch (e) {
      return Future.value(Left(LocalDatabaseFailure(message: e.toString())));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAuth(String id) async {
    try {
      await _authLocalDataSource.deleteAuth(id);
      return Right(null);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: "Error deleting auth: $e"));
    }
  }

  @override
  Future<Either<Failure, List<AuthEntity>>> getAllAuth() async {
    try {
      final authList = await _authLocalDataSource.getAllAuth();
      return Right(authList);
    } catch (e) {
      return Left(LocalDatabaseFailure(message: "Error getting all auth: $e"));
    }
  }

  @override
  Future<Either<Failure, String>> login(String username, String password) async {
    try {
      final token = await _authLocalDataSource.login(username, password);
      return Right(token);
    }
    catch (e) {
      return Left(LocalDatabaseFailure(message: "Error logging in: $e"));
    }
  }
}
