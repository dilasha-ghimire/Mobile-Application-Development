import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class DeleteAuthParams {
  final String studentId;
  DeleteAuthParams({required this.studentId});
}

class DeleteAuthUsecase implements UsecaseWithParams<void, DeleteAuthParams> {
  final IAuthRepository authRepository;
  DeleteAuthUsecase({required this.authRepository});

  @override
  Future<Either<Failure, void>> call(DeleteAuthParams params) {
    return authRepository.deleteAuth(params.studentId);
  }
}