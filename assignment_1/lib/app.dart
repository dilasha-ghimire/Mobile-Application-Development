import 'package:assignment_1/view/cubit/area_of_circle_cubit.dart';
import 'package:assignment_1/view/cubit/dashboard_cubit.dart';
import 'package:assignment_1/view/cubit/simple_interest_cubit.dart';
import 'package:assignment_1/view/cubit/volume_of_cuboid_cubit.dart';
import 'package:assignment_1/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AreaOfCircleCubit()),
        BlocProvider(create: (context) => SimpleInterestCubit()),
        BlocProvider(create: (context) => VolumeOfCuboidCubit()),
        BlocProvider(
          create: (context) => DashboardCubit(
            context.read<AreaOfCircleCubit>(),
            context.read<SimpleInterestCubit>(),
            context.read<VolumeOfCuboidCubit>(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DashboardCubitView(),
      ),
    );
  }
}
