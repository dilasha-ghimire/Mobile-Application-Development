import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:softwarica_student_management_bloc/app/usecase/usecase.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/repository/batch_repository.dart';

class CreateBatchParams extends Equatable {
  final String batchName;

  const CreateBatchParams({required this.batchName});

  //Empty constructor
  const CreateBatchParams.empty() : batchName = "_empty.string";

  @override
  List<Object?> get props => [batchName];
}

class CreateBatchUsecase implements UsecaseWithParams<void, CreateBatchParams> {
  final IBatchRepository batchRepository;

  CreateBatchUsecase({required this.batchRepository});

  @override
  Future<Either<Failure, void>> call(CreateBatchParams params) async{
    return await batchRepository.createBatch(
      BatchEntity(
        batchName: params.batchName
      )
    );
  }
}