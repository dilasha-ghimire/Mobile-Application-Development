import 'package:dio/dio.dart';
import 'package:softwarica_student_management_bloc/app/constants/api_endpoints.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/data_source/batch_data_source.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/dto/get_all_batch_dto.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/model/batch_api_model.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/entity/batch_entity.dart';

class BatchRemoteDatasource implements IBatchDataSource {
  final Dio _dio;

  BatchRemoteDatasource({
    required Dio dio,
  }) : _dio = dio;

  //batch entity converted to batch api model
  //then the api model is converted to json and posted to server
  @override
  Future<void> createBatch(BatchEntity batchEntity) async {
    try {
      var batchApiModel = BatchApiModel.fromEntity(batchEntity);
      var response = await _dio.post(
        ApiEndpoints.createBatch,
        data: batchApiModel.toJson()
      );
      if(response.statusCode == 201) {
        return;
      }
      else {
        throw Exception(response.statusMessage);
      }
    }
    //two kinds of exception
    //DioException = to handle different status code errors from server
    on DioException catch(e) {
      throw Exception(e);
    }
    catch(e) {
      throw Exception(e);
    }
  }
  
  @override
  Future<void> deleteBatch(String id) {
    // TODO: implement deleteBatch
    throw UnimplementedError();
  }
  
  @override
  Future<List<BatchEntity>> getAllBatches() async {
    try {
      var response = await _dio.get(ApiEndpoints.getAllBatch);
      if(response.statusCode == 200) {
        GetAllBatchDto batchDto = GetAllBatchDto.fromJson(response.data);
        return BatchApiModel.toEntityList(batchDto.data);
      }
      else {
        throw Exception(response.statusMessage);
      }
    }
    on DioException catch(e) {
      throw Exception(e);
    }
    catch(e) {
      throw Exception(e);
    }
  }
}