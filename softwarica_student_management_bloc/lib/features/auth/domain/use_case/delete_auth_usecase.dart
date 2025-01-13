import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/repository/auth_repository.dart';

class DeleteAuthParams extends Equatable {
  final String studentId;

  const DeleteAuthParams({required this.studentId});

  @override
  List<Object?> get props => [studentId];
}

class DeleteAuthUseCase implements UsecaseWithParams<void, DeleteAuthParams> {
  final IAuthRepository repository;

  DeleteAuthUseCase({required this.repository});

  @override
  Future<Either<Failure, void>> call(DeleteAuthParams params) async {
    return await repository.deleteAuth(params.studentId);
  }
}
