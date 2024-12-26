import 'package:flutter_bloc/flutter_bloc.dart';

// Step 1: Create Arithmetic Cubit

class ArithmeticCubit extends Cubit<int> {
  ArithmeticCubit() : super(0);

  void add(int firstNumber, int secondNumber) {
    emit(firstNumber + secondNumber);
  }

  void subtract(int firstNumber, int secondNumber) {
    emit(firstNumber - secondNumber);
  }

  void multiply(int firstNumber, int secondNumber) {
    emit(firstNumber * secondNumber);
  }
}
