import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../area_of_circle_cubit_view.dart';
import '../simple_interest_cubit_view.dart';
import '../volume_of_cuboid_cubit_view.dart';
import 'area_of_circle_cubit.dart';
import 'simple_interest_cubit.dart';
import 'volume_of_cuboid_cubit.dart';

class DashboardCubit extends Cubit<void> {
  DashboardCubit(this._areaOfCircleCubit, this._simpleInterestCubit,
      this._volumeOfCuboidCubit)
      : super(null);

  final AreaOfCircleCubit _areaOfCircleCubit;
  final SimpleInterestCubit _simpleInterestCubit;
  final VolumeOfCuboidCubit _volumeOfCuboidCubit;

  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _areaOfCircleCubit,
          child: AreaOfCircleCubitView(),
        ),
      ),
    );
  }

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _simpleInterestCubit,
          child: SimpleInterestCubitView(),
        ),
      ),
    );
  }

  void openVolumeOfCuboidView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _volumeOfCuboidCubit,
          child: VolumeOfCuboidCubitView(),
        ),
      ),
    );
  }
}
