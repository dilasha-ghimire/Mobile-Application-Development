import 'package:dio/dio.dart';
import 'package:softwarica_student_management_bloc/app/constants/api_endpoints.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/auth_data_source.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/dto/login_dto.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

class AuthRemoteDatasource implements IAuthDataSource {
  final Dio _dio;

  AuthRemoteDatasource(this._dio);

  @override
  Future<void> createAuth(AuthEntity authEntity) async {
    try {
      Response response = await _dio.post(ApiEndpoints.register, data: {
        "fname": authEntity.fname,
        "lname": authEntity.lname,
        "phone": authEntity.phone,
        "username": authEntity.username,
        "password": authEntity.password,
        "batch": authEntity.batch.batchId,
        "course": authEntity.courses.map((e) => e.courseId).toList()
      });
      if (response.statusCode == 201) {
        return;
      } else {
        throw Exception(response.statusMessage);
      }
    } on DioException catch (e) {
      throw Exception(e);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAuth(String id) {
    // TODO: implement deleteAuth
    throw UnimplementedError();
  }

  @override
  Future<List<AuthEntity>> getAllAuth() {
    // TODO: implement getAllAuth
    throw UnimplementedError();
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        ApiEndpoints.login,
        data: {
          "username": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        LoginDto loginDto = LoginDto.fromJson(response.data);
        return loginDto.token;
      } else {
        throw Exception("Login failed: ${response.statusMessage}");
      }
    } on DioException catch (e) {
      throw Exception("Dio Error: ${e.message}");
    } catch (e) {
      throw Exception("An error occurred: ${e.toString()}");
    }
  }
}
