// import 'package:bloc_task/bloc/arithmetic_bloc.dart';
// import 'package:bloc_task/view/cubit/arithmetic_cubit.dart';
// import 'package:bloc_task/view/cubit/counter_cubit.dart';
// import 'package:bloc_task/view/cubit/dashboard_cubit.dart';
// import 'package:bloc_task/view/cubit/user_cubit.dart';
// import 'package:get_it/get_it.dart';

// // cubit - registerFactory to create new instance everytime
// // bloc - registerSingleton to create new instance only once

// final serviceLocator = GetIt.instance;

// Future<void> initDependencies() async {
//   _initBloc();
//   _initCubit();
// }

// void _initBloc() {
//   serviceLocator.registerLazySingleton(() => ArithmeticBloc());
// }

// void _initCubit() {
//   serviceLocator.registerLazySingleton<CounterCubit>(() => CounterCubit());
//   serviceLocator
//       .registerLazySingleton<ArithmeticCubit>(() => ArithmeticCubit());
//   serviceLocator.registerLazySingleton<UserCubit>(() => UserCubit());
//   serviceLocator.registerLazySingleton<DashboardCubit>(
//     // dependency injection
//     () => DashboardCubit(
//       serviceLocator(),
//       serviceLocator(),
//       serviceLocator(),
//     ),
//   );
// }
