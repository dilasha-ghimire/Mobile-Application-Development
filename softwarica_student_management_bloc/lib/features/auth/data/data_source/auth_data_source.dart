import 'package:softwarica_student_management_bloc/features/auth/domain/entity/auth_entity.dart';

abstract interface class IAuthDataSource {
  Future<List<AuthEntity>> getAllAuth();
  Future<void> createAuth(AuthEntity authEntity);
  Future<void> deleteAuth(String id);
  Future<String> login(String username, String password);
}