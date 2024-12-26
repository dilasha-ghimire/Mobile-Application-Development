import 'package:di_repository_pattern/model/user.dart';

class RemoteDataSource {
  List<User> users = [
    User(
      id: 1,
      name: 'Remote Salman',
      age: 30,
    ),
    User(
      id: 2,
      name: 'Remote katrina',
      age: 25,
    ),
    User(
      id: 3,
      name: 'Remote Vicky',
      age: 35,
    )
  ];

  bool addUser(User user) {
    users.add(user);
    return true;
  }

  List<User> getUsers() {
    return users;
  }
}
