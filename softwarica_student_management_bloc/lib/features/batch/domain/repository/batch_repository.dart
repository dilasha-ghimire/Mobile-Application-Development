import 'package:dartz/dartz.dart';
import 'package:softwarica_student_management_bloc/core/error/failure.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';

//I from IBatchRepository - because its an interface
abstract interface class IBatchRepository {
  //Future used: because asynchronous workings (not certain when it will occur)
  //Either: because two results can be produced i.e., failure error or void/list
  //Repository only recognizes Entity

  Future<Either<Failure, void>> createBatch(BatchEntity batchEntity);
  Future<Either<Failure, List<BatchEntity>>> getAllBatches();
  Future<Either<Failure, void>> deleteBatch(String id);
}