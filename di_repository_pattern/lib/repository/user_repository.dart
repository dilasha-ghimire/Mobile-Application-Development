import 'package:di_repository_pattern/data_source/local/local_data_source.dart';
import 'package:di_repository_pattern/data_source/remote/remote_data_source.dart';
import 'package:di_repository_pattern/model/user.dart';

class UserRepository {
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  UserRepository(this.localDataSource, this.remoteDataSource);

  bool hasNetwork = false;

  bool addUser(User user) {
    bool isAdded = false;
    if (hasNetwork) {
      isAdded = remoteDataSource.addUser(user);
    } else {
      isAdded = localDataSource.addUser(user);
    }
    return isAdded;
  }

  List<User> getUsers() {
    if (hasNetwork) {
      return remoteDataSource.getUsers();
    } else {
      return localDataSource.getUsers();
    }
  }
}
