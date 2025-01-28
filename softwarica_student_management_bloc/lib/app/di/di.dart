import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:softwarica_student_management_bloc/core/network/api_service.dart';
import 'package:softwarica_student_management_bloc/core/network/hive_service.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/local_datasource/auth_local_data_source.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/data_source/remote_datasource/auth_remote_datasource.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/repository/auth_local_repository.dart';
import 'package:softwarica_student_management_bloc/features/auth/data/repository/auth_remote_repository.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/use_case/create_auth_usecase.dart';
import 'package:softwarica_student_management_bloc/features/auth/domain/use_case/login_usecase.dart';
import 'package:softwarica_student_management_bloc/features/auth/presentation/view_model/login/login_bloc.dart';
import 'package:softwarica_student_management_bloc/features/auth/presentation/view_model/signup/register_bloc.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/data_source/local_datasource/batch_local_data_source.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/data_source/remote_datasource/batch_remote_datasource.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/repository/batch_local_repository.dart';
import 'package:softwarica_student_management_bloc/features/batch/data/repository/batch_remote_repository.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/use_case/create_batch_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/use_case/delete_batch_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/domain/use_case/get_all_batch_usecase.dart';
import 'package:softwarica_student_management_bloc/features/batch/presentation/view_model/batch_bloc.dart';
import 'package:softwarica_student_management_bloc/features/course/data/data_source/local_datasource/course_local_data_source.dart';
import 'package:softwarica_student_management_bloc/features/course/data/data_source/remote_datasource/course_remote_datasource.dart';
import 'package:softwarica_student_management_bloc/features/course/data/repository/course_local_repository.dart';
import 'package:softwarica_student_management_bloc/features/course/data/repository/course_remote_repository.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/use_case/create_course_usecase.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/use_case/delete_course_usecase.dart';
import 'package:softwarica_student_management_bloc/features/course/domain/use_case/get_all_course_usecase.dart';
import 'package:softwarica_student_management_bloc/features/course/presentation/view_model/course_bloc.dart';
import 'package:softwarica_student_management_bloc/features/home/presentation/view_model/home_cubit.dart';
import 'package:softwarica_student_management_bloc/features/splash/presentation/view_model/splash_cubit.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  //First initialize hive service
  await _initHiveService();
  await _initApiService();

  await _initBatchDependencies();
  await _initCourseDependencies();
  await _initHomeDependencies();
  await _initRegisterDependencies();
  await _initLoginDependencies();
  await _initSplashScreenDependencies();
}

_initHiveService() {
  getIt.registerLazySingleton<HiveService>(() => HiveService());
}

_initApiService() {
  getIt.registerLazySingleton<Dio>(() => ApiService(Dio()).dio);
}

_initBatchDependencies() async {
  //Data source
  getIt.registerLazySingleton<BatchLocalDataSource>(
      () => BatchLocalDataSource(hiveService: getIt()));

  getIt.registerLazySingleton<BatchRemoteDatasource>(
      () => BatchRemoteDatasource(dio: getIt<Dio>()));

  //Repository
  getIt.registerLazySingleton<BatchLocalRepository>(() => BatchLocalRepository(
      batchLocalDataSource: getIt<BatchLocalDataSource>()));

  getIt.registerLazySingleton<BatchRemoteRepository>(() =>
      BatchRemoteRepository(
          batchRemoteDatasource: getIt<BatchRemoteDatasource>()));

  //All 3 usecases
  getIt.registerLazySingleton<CreateBatchUsecase>(() =>
      CreateBatchUsecase(batchRepository: getIt<BatchRemoteRepository>()));

  getIt.registerLazySingleton<GetAllBatchUsecase>(() =>
      GetAllBatchUsecase(batchRepository: getIt<BatchRemoteRepository>()));

  getIt.registerLazySingleton<DeleteBatchUsecase>(
      () => DeleteBatchUsecase(batchRepository: getIt<BatchLocalRepository>()));

  //BLOC
  getIt.registerFactory<BatchBloc>(
    () => BatchBloc(
        createBatchUsecase: getIt<CreateBatchUsecase>(),
        getAllBatchUsecase: getIt<GetAllBatchUsecase>(),
        deleteBatchUsecase: getIt<DeleteBatchUsecase>()),
  );
}

_initCourseDependencies() async {
  getIt.registerLazySingleton<CourseLocalDataSource>(
      () => CourseLocalDataSource(hiveService: getIt()));
  getIt.registerLazySingleton<CourseRemoteDatasource>(
      () => CourseRemoteDatasource(dio: getIt<Dio>()));

  getIt.registerLazySingleton<CourseLocalRepository>(() =>
      CourseLocalRepository(
          courseLocalDataSource: getIt<CourseLocalDataSource>()));
  getIt.registerLazySingleton<CourseRemoteRepository>(() =>
      CourseRemoteRepository(
          courseRemoteDatasource: getIt<CourseRemoteDatasource>()));

  getIt.registerLazySingleton<CreateCourseUsecase>(() =>
      CreateCourseUsecase(courseRepository: getIt<CourseRemoteRepository>()));

  getIt.registerLazySingleton<GetAllCourseUsecase>(() =>
      GetAllCourseUsecase(courseRepository: getIt<CourseRemoteRepository>()));

  getIt.registerLazySingleton<DeleteCourseUsecase>(() =>
      DeleteCourseUsecase(courseRepository: getIt<CourseLocalRepository>()));

  getIt.registerFactory<CourseBloc>(
    () => CourseBloc(
        createCourseUsecase: getIt<CreateCourseUsecase>(),
        getAllCourseUsecase: getIt<GetAllCourseUsecase>(),
        deleteCourseUsecase: getIt<DeleteCourseUsecase>()),
  );
}

_initHomeDependencies() async {
  getIt.registerFactory<HomeCubit>(
    () => HomeCubit(),
  );
}

_initRegisterDependencies() async {
  getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(hiveService: getIt()));
  getIt.registerLazySingleton<AuthRemoteDatasource>(
      () => AuthRemoteDatasource(getIt<Dio>()));

  getIt.registerLazySingleton<AuthLocalRepository>(() =>
      AuthLocalRepository(authLocalDataSource: getIt<AuthLocalDataSource>()));
  getIt.registerLazySingleton<AuthRemoteRepository>(() => AuthRemoteRepository(
      authRemoteDatasource: getIt<AuthRemoteDatasource>()));

  getIt.registerLazySingleton<CreateAuthUsecase>(
      () => CreateAuthUsecase(authRepository: getIt<AuthRemoteRepository>()));

  getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecase(authRepository: getIt<AuthRemoteRepository>()));

  getIt.registerFactory<RegisterBloc>(() => RegisterBloc(
      createAuthUsecase: getIt<CreateAuthUsecase>(),
      batchBloc: getIt<BatchBloc>(),
      courseBloc: getIt<CourseBloc>()));
}

_initLoginDependencies() async {
  getIt.registerFactory<LoginBloc>(
    () => LoginBloc(
      registerBloc: getIt<RegisterBloc>(),
      homeCubit: getIt<HomeCubit>(),
      loginUsecase: getIt<LoginUsecase>()
    ),
  );
}

_initSplashScreenDependencies() async {
  getIt.registerFactory<SplashCubit>(
    () => SplashCubit(getIt<LoginBloc>()),
  );
}
