import 'package:flutter_bloc/flutter_bloc.dart';

class VolumeOfCuboidCubit extends Cubit<double> {
  VolumeOfCuboidCubit() : super(0.0);

  void calculateVolume(double length, double width, double height) {
    final double volume = length * width * height;
    emit(volume);
  }
}
