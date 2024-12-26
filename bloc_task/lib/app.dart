// import 'package:bloc_task/view/arithmetic_view.dart';
// import 'package:bloc_task/view/cubit/arithmetic_cubit.dart';
import 'package:bloc_task/view/cubit/user_cubit.dart';
import 'package:bloc_task/view/user_details_view.dart';
import 'package:bloc_task/view/user_output_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // For "Arithmetic BloC"
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: "Arithmetic BloC",
    //   // Step 3: Wrap app.dart with BlocProvider
    //   home: BlocProvider(
    //     create: (context) => ArithmeticCubit(),
    //     child: ArithmeticView(),
    //   ),
    // );

    // For "Student BloC"
    return BlocProvider(
      create: (_) => UserCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "User BloC",
        initialRoute: "/",
        routes: {
          "/": (context) => const UserDetailsView(),
          "/output": (context) => const UserOutputView(),
        },
      ),
    );
  }
}
