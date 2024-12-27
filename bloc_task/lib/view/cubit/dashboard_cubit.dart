import 'package:bloc_task/view/arithmetic_cubit_view.dart';
import 'package:bloc_task/view/counter_cubit_view.dart';
import 'package:bloc_task/view/cubit/arithmetic_cubit.dart';
import 'package:bloc_task/view/cubit/counter_cubit.dart';
import 'package:bloc_task/view/cubit/user_cubit.dart';
import 'package:bloc_task/view/user_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(this._counterCubit, this._arithmeticCubit, this._userCubit)
      : super(null);

  final CounterCubit _counterCubit;
  final ArithmeticCubit _arithmeticCubit;
  final UserCubit _userCubit;

  void openCounterView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _counterCubit,
                  child: CounterCubitView(),
                )));
  }

  void openArithmeticView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _arithmeticCubit,
                  child: ArithmeticCubitView(),
                )));
  }

  void openUserView(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => BlocProvider.value(
                  value: _userCubit,
                  child: UserCubitView(),
                )));
  }
}
