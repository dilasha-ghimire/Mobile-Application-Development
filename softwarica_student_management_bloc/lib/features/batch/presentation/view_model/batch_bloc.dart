import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/use_case/create_batch_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/use_case/get_all_batch_usecase.dart';

part 'batch_event.dart';
part 'batch_state.dart';

class BatchBloc extends Bloc<BatchEvent, BatchState> {
  final CreateBatchUsecase _createBatchUsecase;
  final GetAllBatchUsecase _getAllBatchUsecase;
  final DeleteBatchUsecase _deleteBatchUsecase;

  BatchBloc({
    required CreateBatchUsecase createBatchUsecase,
    required GetAllBatchUsecase getAllBatchUsecase,
    required DeleteBatchUsecase deleteBatchUsecase,
  })  : _createBatchUsecase = createBatchUsecase,
        _getAllBatchUsecase = getAllBatchUsecase,
        _deleteBatchUsecase = deleteBatchUsecase,
        super(BatchState.initial()) {
    on<LoadBatches>(_onLoadBatches);
    on<AddBatch>(_onAddBatch);
    on<DeleteBatch>(_onDeleteBatch);

    //Call this event whenever the bloc is created
    //Used for
    add(LoadBatches());
  }

  Future<void> _onLoadBatches(
      LoadBatches event, Emitter<BatchState> emit) async {
        emit(state.copyWith(isLoading: true));
        final result  = await _getAllBatchUsecase.call();
        result.fold(
          (failure) => 
            emit(state.copyWith(isLoading: false, error: failure.message)),
          
          (batches) => emit(state.copyWith(isLoading: false, batches: batches))
        );
      }

  Future<void> _onAddBatch(AddBatch event, Emitter<BatchState> emit) async {
    emit(state.copyWith(isLoading: true));
    final result = await _createBatchUsecase
      .call(CreateBatchParams(batchName: event.batchName));
    result.fold(
      (failure) => 
        emit(state.copyWith(isLoading: false, error: failure.message)),
      (batches) {
        emit(state.copyWith(isLoading: false, error: null));
        add(LoadBatches());
      }
    );
  }

  Future<void> _onDeleteBatch(
      DeleteBatch event, Emitter<BatchState> emit) async {
        emit(state.copyWith(isLoading: true));
        final result = await _deleteBatchUsecase
            .call(DeleteBatchParams(batchId: event.batchId));
        result.fold(
          (failure) => 
            emit(state.copyWith(isLoading: false, error: failure.message)),
          (batches) {
            emit(state.copyWith(isLoading: false, error: null));
            //refreshes the list of batches
            add(LoadBatches());
          }
        );
      }
}
