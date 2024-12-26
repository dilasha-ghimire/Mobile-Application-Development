import 'package:di_repository_pattern/di/di.dart';
import 'package:di_repository_pattern/repository/user_repository.dart';

void main() {
  initModule();
  UserRepository userRepository = getIt<UserRepository>();
  print(userRepository.getUsers());
}
