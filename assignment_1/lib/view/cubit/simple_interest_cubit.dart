import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubit extends Cubit<double> {
  SimpleInterestCubit() : super(0.0);

  void calculateSimpleInterest({
    required double principal,
    required double rate,
    required double time,
  }) {
    emit((principal * rate * time) / 100);
  }
}
