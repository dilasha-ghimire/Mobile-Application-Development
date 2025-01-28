import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class LoginParams extends Equatable {
  final String username;
  final String password;

  const LoginParams({required this.username, required this.password});

  const LoginParams.initial()
    : username = "",
      password = "";
  
  @override
  List<Object?> get props => [username, password];
}

class LoginUsecase implements UsecaseWithParams<void, LoginParams> {
  final IAuthRepository authRepository;

  LoginUsecase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(LoginParams params) async {
    return await authRepository.login(params.username, params.password);
  }
}