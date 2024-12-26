import 'package:di_repository_pattern/data_source/local/local_data_source.dart';
import 'package:di_repository_pattern/data_source/remote/remote_data_source.dart';
import 'package:di_repository_pattern/repository/user_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initModule() {
  getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSource());
  getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSource());
  getIt.registerLazySingleton<UserRepository>(
      () => UserRepository(getIt(), getIt()));
}
