import 'package:di_repository_pattern/model/user.dart';

class LocalDataSource {
  List<User> users = [
    User(
      id: 1,
      name: 'Local John',
      age: 30,
    ),
    User(
      id: 2,
      name: 'Local Jane',
      age: 25,
    ),
  ];

  bool addUser(User user) {
    users.add(user);
    return true;
  }

  List<User> getUsers() {
    return users;
  }
}
