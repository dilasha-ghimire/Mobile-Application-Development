import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(90);
  void increment() {
    emit(state + 1);
  }

  void decrement() {
    if (state == 98) {
      return;
    } else {
      emit(state - 1);
    }
  }

  void reset() {
    emit(90);
  }
}
