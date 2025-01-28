import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRemoteRepository({required AuthRemoteDatasource authRemoteDatasource})
      : _authRemoteDatasource = authRemoteDatasource;

  @override
  Future<Either<Failure, void>> createAuth(AuthEntity authEntity) async {
    try {
      _authRemoteDatasource.createAuth(authEntity);
      return Right(null);
    } catch (e) {
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteAuth(String id) {
    // TODO: implement deleteAuth
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AuthEntity>>> getAllAuth() {
    // TODO: implement getAllAuth
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> login(
      String username, String password) async {
    try {
      final token = await _authRemoteDatasource.login(username, password);
      return Right(token);
    } catch (e) {
      return Left(
        ApiFailure(
          message: e.toString(),
        ),
      );
    }
  }
}
