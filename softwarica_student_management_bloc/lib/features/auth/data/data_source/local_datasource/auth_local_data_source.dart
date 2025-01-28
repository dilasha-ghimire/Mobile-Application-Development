import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/auth_data_source.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/model/auth_hive_model.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;
  AuthLocalDataSource({required HiveService hiveService})
      : _hiveService = hiveService;

  @override
  Future<void> createAuth(AuthEntity authEntity) async {
    try {
      final authHiveModel = AuthHiveModel.fromEntity(authEntity);
      await _hiveService.addAuth(authHiveModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> deleteAuth(String id) async {
    try {
      await _hiveService.deleteAuth(id);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<List<AuthEntity>> getAllAuth() {
    try {
      return _hiveService.getAllAuth().then((value) {
        return value.map((e) => e.toEntity()).toList();
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      final user = await _hiveService.login(username, password);
      return Future.value("Login successful");
    } 
    catch (e) {
      throw Exception(e); 
    }
  }
}
