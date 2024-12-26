import 'package:di_repository_pattern/di/di.dart';
import 'package:di_repository_pattern/model/user.dart';
import 'package:di_repository_pattern/repository/user_repository.dart';

void main() {
  initModule();
  User user = User(
    id: 1,
    name: 'John Doe',
    age: 30,
  );

  UserRepository userRepository = getIt<UserRepository>();
  if (userRepository.addUser(user)) {
    print('User added successfully');
  } else {
    print('User not added');
  }
}
