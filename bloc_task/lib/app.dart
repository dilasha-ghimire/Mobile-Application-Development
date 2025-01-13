// import 'package:bloc_task/service_locator/service_locator.dart';
// import 'package:bloc_task/view/cubit/dashboard_cubit.dart';
// import 'package:bloc_task/view/dashboard_cubit_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // return MultiBlocProvider(
//     // providers: [
//     //   BlocProvider<CounterCubit>(
//     //     create: (context) => serviceLocator(),
//     //   ),
//     //   BlocProvider(
//     //     create: (context) => serviceLocator<ArithmeticCubit>(),
//     //   ),
//     //   BlocProvider<CounterCubit>(
//     //     create: (context) => serviceLocator(),
//     //   ),
//     //   BlocProvider(
//     //     create: (context) => serviceLocator<UserCubit>(),
//     //   ),
//     // ],
//     // ),
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BlocProvider.value(
//         value: serviceLocator<DashboardCubit>(),
//         child: DashboardView(),
//       ),
//     );
//   }
// }
