import 'package:bloc_task/view/cubit/arithmetic_cubit.dart';
import 'package:bloc_task/view/cubit/counter_cubit.dart';
import 'package:bloc_task/view/cubit/dashboard_cubit.dart';
import 'package:bloc_task/view/cubit/user_cubit.dart';
import 'package:bloc_task/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => CounterCubit()),
          BlocProvider(create: (context) => ArithmeticCubit()),
          BlocProvider(create: (context) => UserCubit()),
          BlocProvider(
            create: (context) => DashboardCubit(
              context.read<CounterCubit>(),
              context.read<ArithmeticCubit>(),
              context.read<UserCubit>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: DashboardView(),
        ));
  }
}
